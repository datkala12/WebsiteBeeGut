package com.dat.beans;

import com.dat.entities.Order;
import com.dat.entities.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailModel {

	private double price;
	private int quantity;
	private Order order;
	private Product product;
}
