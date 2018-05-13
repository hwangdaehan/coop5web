package yjc.wdb.back;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;


import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yjc.wdb.file.MediaUtils;
import yjc.wdb.file.UploadFileUtils;
@Controller
public class UploadController {


    // xml�� ������ ���ҽ� ����
    // bean�� id�� uploadPath�� �±׸� ����
//    @Resource(name="uploadPath")
    String uploadPath = "C:\\Shopping";

    // ���ε� �帧 : ���ε� ��ưŬ�� => �ӽõ��丮�� ���ε�=> ������ ���丮�� ���� => ���������� file�� ����

    /****************************** # �Ϲ����� ����� ���ε� ó��  *********************************/

    // 1. �Ϲ����� ���ε� ���� 
    @RequestMapping(value="/upload/upload", method=RequestMethod.GET)
    public void uplodaForm(){
        // upload/uploadForm.jsp(���ε� ������)�� ������
    }
    // 2. �Ϲ����� ���ε� ó�� ����
    @RequestMapping(value="/upload/upload", method=RequestMethod.POST)
    public ModelAndView uplodaForm(MultipartFile file, ModelAndView mav) throws Exception{
        // ������ �����̸� ����
        String savedName = file.getOriginalFilename();
        // ������ ���� �α� ���
        System.out.println("�����̸� :"+file.getOriginalFilename());
        System.out.println("����ũ�� : "+file.getSize());
        System.out.println("����Ʈ Ÿ�� : "+file.getContentType());
        // ��������+�����̸� �����ϱ� ����  ���ϸ� �������� �޼���ȣ�� 
        savedName = uploadFile(savedName, file.getBytes());
        System.out.println(savedName);
        mav.setViewName("upload/uploadResult");
        mav.addObject("savedName", savedName);

        return mav; // uploadResult.jsp(���ȭ��)�� ������
    }

    // 3. ���ϸ� �������� �޼���
    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        // UUID �߱�
        UUID uuid = UUID.randomUUID();
        // ���ϸ� = UUID + �����̸�
        String savedName = uuid.toString() + "_" + originalName;
        // ���� ���, ���ϸ��� �޾� ���� ��ü ����
        File target = new File(uploadPath, savedName);
        // �ӽõ��丮�� ����� ���ε�� ������ ������ ���丮�� ����
        // FileCopyUtils.copy(����Ʈ�迭, ���ϰ�ü)
        FileCopyUtils.copy(fileData, target);
        return savedName;
    }

    /****************************** # �Ϲ����� ����� ���ε� ó��  *********************************/

    /****************************** # ajax ����� ���ε� ó��  *********************************/

    // 4. Ajax���ε� ������ ����
    @RequestMapping(value="uploadAjax", method=RequestMethod.GET)
    public void uploadAjax(){
        // uploadAjax.jsp�� ������
    }

    // 5. Ajax���ε� ó�� ����
    // ������ �ѱ�ó�� : produces="text/plain;charset=utf-8"
    @ResponseBody // view�� �ƴ� data����
    @RequestMapping(value="uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
       System.out.println("originalName : "+file.getOriginalFilename());
       System.out.println("size : "+file.getSize());
       System.out.println("contentType : "+file.getContentType());
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }

    // 6. �̹��� ǥ�� ����
    @ResponseBody // view�� �ƴ� data����
    @RequestMapping("MapService/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // ������ ������ �ٿ�ε��ϱ� ���� ��Ʈ��
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // Ȯ���ڸ� �����Ͽ� formatName�� ����
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // ������ Ȯ���ڸ� MediaUtilsŬ��������  �̹������Ͽ��θ� �˻��ϰ� ���Ϲ޾� mType�� ����
            MediaType mType = MediaUtils.getMediaType(formatName);
            // ��� ���� ��ü(�ܺο��� �����͸� �ְ���� ������ header�� body�� �����ؾ��ϱ� ������)
            HttpHeaders headers = new HttpHeaders();
            // InputStream ����
            in = new FileInputStream(uploadPath + fileName);
            // �̹��� �����̸�
            if (mType != null) { 
                headers.setContentType(mType);
            // �̹����� �ƴϸ�
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // �ٿ�ε�� ����Ʈ Ÿ��
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // ����Ʈ�迭�� ��Ʈ������ : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 ���������, ū ����ǥ ���ο�  " \" ���� \" "
                // ������ �ѱ� ���� ����
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // ����Ʈ�迭, ���, HTTP�����ڵ�
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP���� �ڵ�()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //��Ʈ�� �ݱ�
        }
        return entity;
    }

    // 7. ���� ���� ����
    @ResponseBody // view�� �ƴ� ������ ����
    @RequestMapping(value = "deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // ������ Ȯ���� ����
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // �̹��� ���� ���� �˻�
        MediaType mType = MediaUtils.getMediaType(formatName);
        // �̹����� ���(����� + �������� ����), �̹����� �ƴϸ� �������ϸ� ����
        // �̹��� �����̸�
        if (mType != null) {
            // ����� �̹��� ���� ����
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // ����� �̹��� ����
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // ���� ���� ����
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // �����Ϳ� http ���� �ڵ� ����
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
}


    /****************************** # ajax ����� ���ε� ó��  *********************************/