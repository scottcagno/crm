package com.cagnosolutions.modules.crm.pdf;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/document")
public class TestController {

	@RequestMapping(value = "/{docName}", method = RequestMethod.POST)
	@ResponseBody
	public Object test(@PathVariable String docName, @RequestBody Map<String,String> allRequestParams) {
		System.out.println(docName);
		allRequestParams.forEach( (k, v) -> System.out.printf("%s : %s\n", k, v));
		return allRequestParams;
	}
}
