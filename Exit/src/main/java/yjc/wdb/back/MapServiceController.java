package yjc.wdb.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapServiceController {

	
	
	@RequestMapping(value="MapService", method= RequestMethod.GET)
	public String Main() {
		return "MapService";
	}
}
