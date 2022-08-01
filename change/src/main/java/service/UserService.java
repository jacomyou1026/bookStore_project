package service;

import java.util.HashMap;
import java.util.List;

import vo.DeliveryVO;
import vo.UserVO;

public interface UserService {
	List<DeliveryVO> pagging1(String id ,String page,String url);
	String pagging2(String id, String url);
	String payback(String orderId, String id, String url);
	UserVO selectOne(String id);
}
