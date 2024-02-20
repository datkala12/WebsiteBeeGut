package com.dat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.dat.entities.Account;
import com.dat.repositories.AccountRepository;

@Service
public class SecurityUserDetailsService implements UserDetailsService{
	@Autowired
	private AccountRepository accRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Account account = accRepo.findByEmailEquals(email);
		if(account==null) {
			throw new UsernameNotFoundException("Invalid username or password");
		}

        return new UserDetailImp(account);
	}

}
