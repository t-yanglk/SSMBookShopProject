package com.ssm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * 分类控制器
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.modle.Catalogue;
import com.ssm.modle.Commodity;
import com.ssm.modle.SuperPage;
import com.ssm.serviceimpl.CatalogueServiceImpl;

@Controller
@RequestMapping("/catalogue")
public class CatalogueController {
	@Autowired
	private CatalogueServiceImpl csi;
	
	//跳转到分类信息页面
			@RequestMapping("/selectcata")
			public String catalogueback(Catalogue cata,SuperPage sp,Map<String,Object> map) {
				//进行分页操作
				int pageno=sp.getPageno()==0?1:sp.getPageno();
				int pagesize=sp.getPagesize()==0?10:sp.getPagesize();
				PageHelper.startPage(pageno, pagesize);
				sp.setPageno(pageno);
				sp.setPagesize(pagesize);
				//将分页信息导入
				List<Catalogue> catas=csi.findAll(cata);
				PageInfo<Catalogue> pi=new PageInfo<Catalogue>(catas);
				if(pi.getPages()>=5) {
					pi.calcByNavigatePages(5);
				}else {
					pi.calcByNavigatePages(pi.getPages());
				}
				map.put("pi",pi);
				map.put("catas", catas);
				return "backstage/catalogueback";
			}

	// 对分类进行删除
	@PostMapping("/deletecata")
	@ResponseBody
	public String delCata(String cataid) {
		boolean success = false;
			int del=csi.delByCataid(cataid);
			csi.delByPreid(cataid);
			if(del>0) {
				success=true;
			}
		return "{\"success\":" + success + "}";
	}

	// 显示增加页面
	@RequestMapping("/addcatajsp")
	public String addjsp(String depth, String preid,Map<String,Object> map) {
		int level = Integer.valueOf(depth);
		level += 1;
		map.put("depth", level);
		map.put("preid", preid);
		return "backstage/addcata";
	}

	// 对分类进行添加
	@SuppressWarnings("unused")
	@PostMapping("/insertcata")
	public String insertCata(Map<String, Object> map,HttpServletRequest req,Map<String,String> error) {
		
		FileItemFactory fif=new DiskFileItemFactory();
		ServletFileUpload sfu=new ServletFileUpload(fif);
			try {
				List<FileItem> items = sfu.parseRequest(req);
				for(FileItem item:items) {
					switch(item.getFieldName()) {
					case "catalogueid":{
						map.put("cataid",item.getString("UTF-8"));
						break;}
					case "cataname":{
						map.put("cataname", item.getString("UTF-8"));
						break;}
					case "image":{
						String path="D:\\eclipse-workspace\\SSMb2cProject\\src\\main\\webapp\\assest\\img\\catalogue\\";
						File file=new File(path+item.getName());
						item.write(file);
						String imgpath="assest/img/catalogue/"+item.getName();
						map.put("cataimg", imgpath);
						break;
					}
					case "depth":{
						map.put("depth", item.getString("UTF-8"));
						break;}
					case "preid":{
						map.put("preid",item.getString("UTF-8"));
						break;}
					}
				}
				csi.insertcata(map);
				error.put("error", "图书分类信息添加成功！");
				return "backstage/addcata";
				
			}catch(Exception e) {
				e.printStackTrace();
				error.put("error","请仔细核对完善分类添加信息！");
				return "backstage/addcata";
			}
		
	}

	// 批量删除分类信息
	@PostMapping("/delcheck")
	@ResponseBody
	public String delCatas(String cataids) {
		String[] ids = cataids.split(",");
		boolean success = true;
		int a = 0;
			for(int i=0;i<ids.length;i++) {
				int b=csi.delByCataid(ids[i]);
				String cataid=ids[i];
				csi.delByPreid(cataid);
				if(b>0) {
					a++;
				}
			}
		if (a == ids.length) {
			success = true;
		}
		return "{\"success\":" + success + "}";
	}
	//跳转分类修改页面
	@RequestMapping("/updatecatajsp")
	public String updateCataJsp(String cataid,Map<String,Object> map) {
		Catalogue cata=csi.findByCataid(cataid);
		List<String> preids=new ArrayList<>();
		if(cata.getDepth()==1) {
			preids.add(" ");
		}else if(cata.getDepth()==2){
			List<Catalogue> catas=csi.findDepthItem(1);
			for(int i=0;i<catas.size();i++) {
				preids.add(catas.get(i).getCatalogueid());
			}
		}
		map.put("preids", preids);
		map.put("cata", cata);
		return "backstage/updatecata";
	}

	// 对分类信息进行修改
	@SuppressWarnings("unused")
	@PostMapping("/updatecata")
	public String updateCata(HttpServletRequest req,Map<String, Object> map) {
		FileItemFactory fif=new DiskFileItemFactory();
		ServletFileUpload sfu=new ServletFileUpload(fif);
			try {
				List<FileItem> items = sfu.parseRequest(req);
				for(FileItem item:items) {
					switch(item.getFieldName()) {
					case "catalogueid":{
						map.put("cataid",item.getString("UTF-8"));
						break;}
					case "cataname":{
						map.put("cataname", item.getString("UTF-8"));
						break;}
					case "image":{
						String path="D:\\eclipse-workspace\\SSMb2cProject\\src\\main\\webapp\\assest\\img\\catalogue\\";
						if(item.getName()!="") {
							File file=new File(path+item.getName());
							item.write(file);
							String imgpath="assest/img/catalogue/"+item.getName();
							map.put("cataimg", imgpath);
						}else {
							map.put("cataimg", "");
						}
						break;
					}
					case "depth":{
						map.put("depth", item.getString("UTF-8"));
						break;}
					case "preid":{
						map.put("preid",item.getString("UTF-8"));
						break;}
					}
				}
			csi.updateCata(map);
			return "redirect:/catalogue/selectcata";
		}catch(Exception e) {
			map.put("error", "请仔细核对修改信息！");
			return "backstage/addcata";
		}
	}

	//分类热销统计分析
	@RequestMapping("/echartview")
	public String catalogueView(Map<String,Object> map) {
		StringBuilder data=new StringBuilder();
		List<Catalogue> catas=csi.findDepthItem(2);
		String saledata="";
		for(Catalogue cata:catas) {
			int salecount=0;
			List<Commodity> comms=cata.getComms();
			for(int i=0;i<comms.size();i++) {
				salecount+=comms.get(i).getSelasvolume();
			}
			data.append("{value: "+salecount+", name: '"+cata.getCataname()+"'},");
			if(data.substring(data.length()-1).equals(",")) {
				saledata=data.substring(0,data.length()-1);
			}
		}
		map.put("data", saledata);
		return "backstage/catalogueview";
	}
}
