package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bean.*;
import com.service.UserInfoService;
@Controller
@RequestMapping("/file")
public class FileUpLoadController {

	@Autowired
	UserInfoService us;
	//音频文件上传
		@RequestMapping(value="/upload",method ={RequestMethod.POST})
		public void loadupPhoto(@RequestParam(value="upfile",required=false) MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
			//��ȡ�ļ���
			String filename=file.getOriginalFilename();
			System.out.println(filename);
			//获取服务器存储路劲
			String savepath = request.getRealPath("/voice");
			System.out.println(savepath);
			//没有文件夹的话创建文件夹
			File files = new File(savepath);
			if (!files.exists()) {
				files.mkdirs();
			}
			//为了文件名不重复加上UUID
			TapeFile tapefile=new TapeFile();
			Date date=new Date(); 
			tapefile.setTape_time(date);
			tapefile.setArtid(Integer.parseInt(request.getParameter("artid")));
			//String newName=UUID.randomUUID()+filename;
			String newName=date.getTime()+filename+".mp3";
			tapefile.setVoice_name(newName);
			File finalFile =new File(savepath+File.separator+newName);
			//更改文件名
			file.transferTo(finalFile);
			
			UserInfo user=(UserInfo)request.getSession().getAttribute("userinfo");
			tapefile.setUserid(user.getId());
			int num=us.addtapefile(tapefile);
		    response.getWriter().println(num);
		}
		@RequestMapping(value="/deltape",method= {RequestMethod.GET})
		public void detelTape(TapeFile tape,HttpServletResponse response) {
			
			int num=us.deleteTape(tape);
			if(num>=1) {
					try {
						response.getWriter().println("删除成功！");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}else {
				try {
					response.getWriter().println("删除失败！");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		//加载我的录音文件
		@RequestMapping(value="/loadtape",method= {RequestMethod.GET})
		public String loadTape(Model model,HttpSession session) {
			UserInfo user=(UserInfo)session.getAttribute("userinfo");
			List<TapeFile> tapeList=us.getTapeFile(user.getId());
			model.addAttribute("tapeList",tapeList);
			return "/jsp/voicetest";
		}
}
