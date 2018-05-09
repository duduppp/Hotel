package com.fh.service.Vendition.waremessage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.Vendition.waremessage.WaremessageManager;

/**
 * 说明： 商品基本信息表 创建人：dp 创建时间：2018-04-17
 * 
 * @version
 */
@Service("waremessageService")
public class WaremessageService implements WaremessageManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 新增
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception {
		dao.save("WaremessageMapper.save", pd);
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("WaremessageMapper.delete", pd);
	}

	/**
	 * 修改
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("WaremessageMapper.edit", pd);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"WaremessageMapper.datalistPage", page);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao
				.findForList("WaremessageMapper.listAll", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("WaremessageMapper.findById", pd);
	}

	/**
	 * 批量删除
	 * 
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("WaremessageMapper.deleteAll", ArrayDATA_IDS);
	}

	public String replenishment(PageData newPd) throws Exception {

		PageData quickEditPageData = findById(newPd);
		//库存
		String stockStr = quickEditPageData.getString("STOCK");
		int stock = Integer.parseInt(stockStr);
		String newStockStr = newPd.getString("PurchaseNum");
		int newStock = Integer.parseInt(newStockStr); 
		//库存更新
		quickEditPageData.put("STOCK", String.valueOf(stock + newStock));
		//会员价格改变
		quickEditPageData.put("STOCKPRICE", newPd.getString("STOCKPRICE"));

		dao.update("WaremessageMapper.edit", quickEditPageData);		
		String string="入库成功:"+quickEditPageData.getString("WAREMESSAGE_ID")+"\n";		
		string+="商品名称:"+quickEditPageData.getString("WARENAME")+"\n";
		string+="本次入库:"+newStock+" 采购价格:"+quickEditPageData.getString("SHOPPINGPRICE")+"\n";
		string+="当前库存:"+(stock + newStock)+" 平均成本:"+quickEditPageData.getString("SHOPPINGPRICE")+"\n";
	 
		return string; 

	}
	
	/**
	 * 预警查询数据 
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> warnlist(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"WaremessageMapper.warnlistPage", page);
	}

 
	@SuppressWarnings("unchecked")
	public List<PageData> findWare(PageData pd) throws Exception {
		 
		return (List<PageData>) dao
				.findForList("WaremessageMapper.findWare", pd);
	}

	@Override
	public PageData findByWARE_BARCODE(PageData pd) throws Exception {
	 
		return (PageData) dao.findForObject("WaremessageMapper.findByWARE_BARCODE", pd); 
	}

}
