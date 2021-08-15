package com.ssm.controller;
/**
 * 商品控制器
 */

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.ssm.serviceimpl.CommodityServiceImpl;
import com.ssm.util.RandomClass;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
	
	@Autowired
	private CatalogueServiceImpl csi;
	@Autowired
	private CommodityServiceImpl cosi;
	
		//跳转到商品信息页面
		@RequestMapping("/selectcomm")
		public String commodityback(Commodity comm,SuperPage sp,Map<String,Object> map) {
			//进行分页操作
			int pageno=sp.getPageno()==0?1:sp.getPageno();
			int pagesize=sp.getPagesize()==0?10:sp.getPagesize();
			PageHelper.startPage(pageno, pagesize);
			sp.setPageno(pageno);
			sp.setPagesize(pagesize);
			//将分页信息导入
			List<Commodity> comms=cosi.findAll(comm);
			PageInfo<Commodity> pi=new PageInfo<Commodity>(comms);
			if(pi.getPages()>=5) {
				pi.calcByNavigatePages(5);
			}else {
				pi.calcByNavigatePages(pi.getPages());
			}
			map.put("pi",pi);
			map.put("comms", comms);
			return "backstage/commodityback";
		}
		//批量删除相应的商品
		@RequestMapping("/delcheck")
		@ResponseBody
		public String delcheck(String checkids) {
			boolean success=true;
			int a=0;
			String[] checkedid=checkids.split(",");
			List<String> ids=Arrays.asList(checkedid);
			for(int i=0;i<ids.size();i++) {
				int b=cosi.delByCheckid(ids.get(i));
				if(b==1) {
					a++;
				}
			}
			if(a==ids.size()) {
				success=true;
			}
			return "{\"success\":"+success+"}";
		}
		//单个删除商品
		@PostMapping("/deletecomm")
		@ResponseBody
		public String delete(String id) {
			boolean success=true;
			int a=cosi.delByCheckid(id);
			if(a==1) {
				success=true;
			}
			return "{\"success\":"+success+"}";
		}
		//跳转商品添加界面
		@PostMapping("/addcommjsp")
		public String addcommjsp(String preid,String rootid,Map<String,String> map) {
			map.put("preid", preid);
			map.put("rootid", rootid);
			return "backstage/addcomm";
		}
		
		//添加商品
		@RequestMapping("/insertcomm")
		public String addcomm(Commodity comm,HttpServletRequest req,Map<String,Object> massage) {
			FileItemFactory fif=new DiskFileItemFactory();
			ServletFileUpload sfu=new ServletFileUpload(fif);
				try {
					List<FileItem> items = sfu.parseRequest(req);
					for(FileItem item:items) {
						switch(item.getFieldName()) {
						case "commid":{
							comm.setCommid(item.getString("UTF-8"));
							break;}
						case "commname":{
							comm.setCommname(item.getString("UTF-8"));
							break;}
						case "commprice":{
							comm.setCommprice(Integer.valueOf(item.getString("UTF-8")));
							break;}
						case "image":{
							String path="D:\\eclipse-workspace\\SSMb2cProject\\src\\main\\webapp\\assest\\img\\commodity\\";
							File file=new File(path+item.getName());
							item.write(file);
							String imgpath="commodity/"+item.getName();
							comm.setCommimg(imgpath);
							break;
						}
						case "rootid":{
							comm.setRootid(item.getString("UTF-8"));
							massage.put("rootid", comm.getRootid());
							break;}
						case "preid":{
							comm.setPreid(item.getString("UTF-8"));
							massage.put("preid", comm.getPreid());
							break;}
						case "description":{
							comm.setDescription(item.getString("UTF-8"));
							break;}
						case "count":{
							comm.setCount(Integer.valueOf(item.getString("UTF-8")));
							break;}
						case "commdetails":{
							comm.setCommdetails(item.getString("UTF-8"));
							break;}
						}
					}
					Commodity ncomm=cosi.findById(comm.getCommid());
					if(ncomm!=null) {
						massage.put("error", "该商品已存在，请重新输入商品编号！");
						return "backstage/addcomm";
					}
					cosi.insertcomm(comm);
					massage.put("error", "商品添加成功！");
					return "backstage/addcomm";
				}catch(Exception e) {
					e.printStackTrace();
					massage.put("error","请仔细核对完善添加信息！");
					return "backstage/addcomm";
				}
		}
		
		//跳转到修改页面
		@PostMapping("/updatecommjsp")
		public String updateComm(String commid,Map<String,Object> map) {
			Commodity comm=cosi.findById(commid);
			map.put("comm", comm);
			return "backstage/updatecomm";
		}
		//修改成功返回
		@PostMapping("/updatesucc")
		public String updatesucc(Commodity comm,HttpServletRequest req,Map<String,Object> massage) {
			FileItemFactory fif=new DiskFileItemFactory();
			ServletFileUpload sfu=new ServletFileUpload(fif);
			try {
				List<FileItem> items = sfu.parseRequest(req);
				for(FileItem item:items) {
					switch(item.getFieldName()) {
					case "commid":{
						comm.setCommid(item.getString("UTF-8"));
						break;}
					case "commname":{
						comm.setCommname(item.getString("UTF-8"));
						break;}
					case "commprice":{
						comm.setCommprice(Integer.valueOf(item.getString("UTF-8")));
						break;}
					case "image":{
						if(item.getName()!=null&&!item.getName().trim().equals("")) {
							String path="D:\\eclipse-workspace\\SSMb2cProject\\src\\main\\webapp\\assest\\img\\commodity\\";
							File file=new File(path+item.getName());
							item.write(file);
							String imgpath="commodity/"+item.getName();
							comm.setCommimg(imgpath);
							break;
						}else {
							comm.setCommimg(cosi.findById(comm.getCommid()).getCommimg());
							break;
						}
						
					}
					case "rootid":{
						comm.setRootid(item.getString("UTF-8"));
						break;}
					case "preid":{
						comm.setPreid(item.getString("UTF-8"));
						break;}
					case "description":{
						comm.setDescription(item.getString("UTF-8"));
						break;}
					case "count":{
						comm.setCount(Integer.valueOf(item.getString("UTF-8")));
						break;}
					case "commdetails":{
						comm.setCommdetails(item.getString("UTF-8"));
						break;}
					}
				}
				cosi.updateComm(comm);
				massage.put("error", "成功修改图书信息！");
				return "redirect:/commodity/selectcomm";
			}catch(Exception e) {
				massage.put("error", "请仔细核对修改信息！");
				return "forward:/commodity/updatecommjsp?commid="+comm.getCommid();
			}
		}
		//跳转图书热销统计
		@RequestMapping("/echartview")
		public String toEchartView(Map<String,Object> map) {
			
			List<Catalogue> catas=csi.findDepthItem(1);
			List<Commodity> comms=cosi.findCommsByRootid(catas.get(0).getCatalogueid());
			StringBuilder commnames=new StringBuilder();
			StringBuilder commcounts=new StringBuilder();
			for(Commodity comm:comms) {
				commnames.append("'"+comm.getCommname()+"',");
				String color=RandomClass.randomColor();
				commcounts.append("{value: "+comm.getSelasvolume()+",itemStyle: {color: '"+color+"'}},");
			}
			String names=commnames.substring(0,commnames.length()-1);
			String counts=commcounts.substring(0,commcounts.length()-1);
			map.put("catas", catas);
			map.put("commnames", names);
			map.put("commcounts", counts);
			return "backstage/commodityview";
		}
		
		@PostMapping("/showcommsale")
		public String showCommSales(String catalogueid,Map<String,Object> map) {
			List<Catalogue> catas=csi.findDepthItem(1);
			List<Commodity> comms=cosi.findCommsByRootid(catalogueid);
			StringBuilder commnames=new StringBuilder();
			StringBuilder commcounts=new StringBuilder();
			for(Commodity comm:comms) {
				commnames.append("'"+comm.getCommname()+"',");
				String color=RandomClass.randomColor();
				commcounts.append("{value: "+comm.getSelasvolume()+",itemStyle: {color: '"+color+"'}},");
			}
			String names=commnames.substring(0,commnames.length()-1);
			String counts=commcounts.substring(0,commcounts.length()-1);
			map.put("catas", catas);
			map.put("commnames", names);
			map.put("commcounts", counts);
			return "backstage/commodityview";
		}
		
		
}
