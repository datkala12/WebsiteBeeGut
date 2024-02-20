package com.dat.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dat.beans.HistoryModel;
import com.dat.beans.ProductModel;
import com.dat.entities.Account;
import com.dat.entities.Categories;
import com.dat.entities.Product;
import com.dat.repositories.AccountRepository;
import com.dat.repositories.CategoryRepository;
import com.dat.repositories.OrderDetailRepository;
import com.dat.repositories.ProductRepository;

@Controller
public class HomeController {
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private CategoryRepository cateRepo;
	@Autowired
	private OrderDetailRepository odetailRepo;
	@Autowired
	private HttpSession session;
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private HttpServletRequest request;

	@GetMapping("home")
	public String home(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "12") int size,
			@ModelAttribute("product") ProductModel product) {
		Principal principal = request.getUserPrincipal();
		Account account = this.accRepo.findByEmailEquals(principal.getName());
		if (account != null) {
			List<HistoryModel> listDetail = this.odetailRepo.getHistory(account.getId());
			session.setAttribute("countCart", listDetail.size());
		}
		model.addAttribute("page", page);
		Pageable pageable = PageRequest.of(page, size);
		Page<Product> p = this.productRepo.findAll(pageable);
		List<Categories> listCate = this.cateRepo.findAll();

		model.addAttribute("listCate", listCate);
		model.addAttribute("data", p);
		return "commons/home";
	}
	@RequestMapping("home/mon")
	public String search(Model model, 
			@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		List<Product> pro = productRepo.findByPrice(minPrice, maxPrice);
		model.addAttribute("data", pro);
		return "home";
	}
}
