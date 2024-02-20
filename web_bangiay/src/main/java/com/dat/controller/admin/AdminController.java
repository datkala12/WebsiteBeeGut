package com.dat.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dat.entities.OrderDetail;
import com.dat.repositories.AccountRepository;
import com.dat.repositories.OrderDetailRepository;
import com.dat.repositories.OrderRepository;
import com.dat.repositories.ProductRepository;

@Controller
public class AdminController {
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private OrderDetailRepository odetailRepo;
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private AccountRepository accRepo;

	@PreAuthorize("hasAuthority('1')")
	@GetMapping("admin")
	public String admin(Model model) {
		long totalAcc = this.accRepo.count();
		long totalPro = this.productRepo.count();
		long totalOrder = this.orderRepo.count();
		long totalPayment = 0;
		List<OrderDetail> odetail = this.odetailRepo.findAll();
		for (OrderDetail orderDetail : odetail) {
			totalPayment += orderDetail.getPrice() * orderDetail.getQuantity();
		}
		model.addAttribute("totalAcc", totalAcc);
		model.addAttribute("totalPro", totalPro);
		model.addAttribute("totalOrder", totalOrder);
		model.addAttribute("totalPayment", totalPayment);
		return "admin/admin";
	}

}
