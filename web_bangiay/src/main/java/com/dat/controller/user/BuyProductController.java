package com.dat.controller.user;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.dat.beans.HistoryModel;
import com.dat.entities.Account;
import com.dat.entities.Product;
import com.dat.repositories.AccountRepository;
import com.dat.repositories.OrderDetailRepository;

@Controller
public class BuyProductController {

	@Autowired
	private OrderDetailRepository odetailRepo;
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;

	@GetMapping("/user/buy-product/{id}")
	public String index(@PathVariable("id") Product product, Model model) {
		Principal principal = request.getUserPrincipal();
		Account account = this.accRepo.findByEmailEquals(principal.getName());
		if (account != null) {
			List<HistoryModel> listDetail = this.odetailRepo.getHistory(account.getId());
			session.setAttribute("countCart", listDetail.size());
		}
		model.addAttribute("product", product);
		return "/user/buy-product";
	}
}
