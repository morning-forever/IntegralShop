package com.bm.webs.service.integralShop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.integralShop.Area;
import com.bm.webs.bean.integralShop.City;
import com.bm.webs.bean.integralShop.Province;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class AddressService {
	
	@Resource
	private DaoSupport dao;
	
	
	public List<Province> getAllProvinces() throws Exception{
		
		return (List<Province>) dao.findForList("AddressMapper.getAllProvinces", null);
	}
	
	public List<City> getCitiesByProvinceId(String provinceId) throws Exception{
		
		return (List<City>) dao.findForList("AddressMapper.getCitiesByProvinceId", provinceId);
	}
	
	public List<Area> getAreasByCityId(String cityId) throws Exception{
		
		return (List<Area>) dao.findForList("AddressMapper.getAreasByCityId", cityId);
	}
	
	public City getCityById(String cityId) throws Exception{
		
		return (City) dao.findForObject("AddressMapper.getCityById", cityId);
	}
	
	public Province getProvinceById(String provinceId) throws Exception{
	
		return (Province)dao.findForObject("AddressMapper.getProvinceById", provinceId);
	}
	
	public Area getAreaById(String areaId) throws Exception{
		
		return (Area) dao.findForObject("AddressMapper.getAreaById", areaId);
	}
}
