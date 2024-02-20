package com.dat.controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.dat.entities.Account;
import com.dat.entities.Categories;
import com.dat.entities.Order;
import com.dat.entities.OrderDetail;
import com.dat.entities.Product;
import com.dat.repositories.AccountRepository;
import com.dat.repositories.CategoryRepository;
import com.dat.repositories.OrderDetailRepository;
import com.dat.repositories.OrderRepository;
import com.dat.repositories.ProductRepository;
import com.dat.service.ExcelAccountGenerator;
import com.dat.service.ExcelCategoryGenerator;
import com.dat.service.ExcelOrderDetailGenerator;
import com.dat.service.ExcelOrderGenerator;
import com.dat.service.ExcelProductGenerator;

@Controller
public class ExcelController {
	@Autowired
	private OrderDetailRepository odetailRepo;
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private ProductRepository proRepo;
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private CategoryRepository cateRepo;

	@GetMapping("/admin/order-detail/excel")
	public void exportOdetailIntoExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=orderdetails_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<OrderDetail> listOfOdetails = odetailRepo.findAll();

		ExcelOrderDetailGenerator generator = new ExcelOrderDetailGenerator(listOfOdetails);

		generator.generate(response);
	}

	@GetMapping("/admin/order/excel")
	public void exportOrderIntoExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=orders_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Order> listOfOrder = orderRepo.findAll();

		ExcelOrderGenerator generator = new ExcelOrderGenerator(listOfOrder);

		generator.generate(response);
	}

	@GetMapping("/admin/account/excel")
	public void exportAccountIntoExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=accounts_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Account> listOfAccounts = accRepo.findAll();

		ExcelAccountGenerator generator = new ExcelAccountGenerator(listOfAccounts);

		generator.generate(response);
	}

	@GetMapping("/admin/product/excel")
	public void exportProductIntoExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=products_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Product> listOfProducts = proRepo.findAll();

		ExcelProductGenerator generator = new ExcelProductGenerator(listOfProducts);

		generator.generate(response);
	}

	@GetMapping("/admin/category/excel")
	public void exportCategoryIntoExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=categories_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Categories> listOfCategories = cateRepo.findAll();

		ExcelCategoryGenerator generator = new ExcelCategoryGenerator(listOfCategories);

		generator.generate(response);
	}
}
