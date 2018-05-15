package yjc.wdb.file;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("FileVo")
public class FileVo {
	// 파일이 저장 될 디렉토리를 지정한다.
	private String filePath;

	public String addfile(HttpServletRequest req) throws Exception {

		//파일 경로 webapps/back/resources/Shopping/
		filePath = req.getSession().getServletContext().getRealPath("/") + "resources" + File.separator + "Shopping";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) req;
		// 파일을 담을곳에 Iterator 객체에 파일 이름을 가져온당.
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		// 폴더가 없다면 생성 해준다.
		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		// 그냥 변수 선언
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		// 값이 false일 때 까지 계속 돌린다.
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				// 한글 꺠짐 방지
				originalFileName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
				// 파일의 확장자를 캐치
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
			}
		}
		return "logo/" + storedFileName;
	}
}