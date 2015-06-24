package com.cagnosolutions.modules.crm.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	@RequestMapping(method = RequestMethod.GET)
	public String get() {
		return "address/address";
	}

}
