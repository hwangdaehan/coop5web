package yjc.wdb.back;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.domain.MemberVO;
import yjc.wdb.domain.b_floor;
import yjc.wdb.domain.building;
import yjc.wdb.domain.enjoy;
import yjc.wdb.service.BuildingService;

@Controller
public class MapServiceController {

	
	@Inject
	BuildingService service;
	
	@RequestMapping(value="MapService", method= RequestMethod.GET)
	public String Main() {
		return "MapService";
	}

	@RequestMapping(value="Bdata", method=RequestMethod.POST)
	public String register(building build,RedirectAttributes rttr)throws Exception {
				service.create(build);
				
				rttr.addFlashAttribute("good","good");
				
		return "redirect:MapService";		
	}
	
	@RequestMapping(value="enjoyInsert", method=RequestMethod.POST)
	public String enjoyInsert(enjoy enjoy,RedirectAttributes rttr)throws Exception {
				service.enjoyInsert(enjoy);
				rttr.addFlashAttribute("nice","nice");
				
		return "redirect:MapService";
	}
	
	@RequestMapping(value="Domyun", method=RequestMethod.POST)
	public String Dregister(b_floor floor,RedirectAttributes rttr)throws Exception {
			service.dcreate(floor);
				rttr.addFlashAttribute("good","good");
		return "redirect:MapService";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "listAll", method = RequestMethod.GET)
	public List<building> listAll() throws Exception {
		
		
		return service.listAll();
	}
	
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public List<building> list() throws Exception {
		
		
		return service.list();
	}
	
	@ResponseBody
	@RequestMapping(value ="ImgSelect", method= RequestMethod.GET)
	public b_floor ImgSelect(b_floor b)throws Exception {
		return service.ImgSelect(b);
	}
	
	@ResponseBody
	@RequestMapping(value="enjoylist", method=RequestMethod.GET)
	public List<enjoy> enjoylist(HttpSession session) throws Exception {
		MemberVO m = (MemberVO) session.getAttribute("member");
		return service.enjoylist(m);
	}
	
	@ResponseBody
	@RequestMapping(value ="AxisFind", method= RequestMethod.GET)
	public building AxisFind(building build) throws Exception {
		return service.AxisFind(build);
	}
	
	@ResponseBody
	@RequestMapping(value="ImgAllSelect", method= RequestMethod.GET)
	public List<b_floor> ImgAllSelect(b_floor b)throws Exception {
		return service.ImgAllSelect(b);
	}

}
