package com.flj.house.service;

import java.util.List;




import com.flj.house.model.HouseInfo;

public interface HouseInfoService {

	public void save(HouseInfo houseInfo);

	public void delete(HouseInfo houseInfo);

	public HouseInfo find_HouseInfo_By_id(int id);

	public List<HouseInfo> List_HouseInfo();
	
	public void update(HouseInfo houseInfo);
	
	public List<HouseInfo> searchHouseInfo(String searchString);//ģ������
	
	public List<HouseInfo> searchHouseInfo(String rentType, String address);//�ص�/  ����
	
	public List<HouseInfo> searchHouseInfo(int low, int high, String address); //�۸�//�ص�
	
	//������������������ҳ�Ĺ��
	public List<HouseInfo> list__to_ads(int limit,int pageSize,String address);
	//������ҳ��
	public int pageAccount(int pageSize,String sql);

}
