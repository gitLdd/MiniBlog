package cn.code4j.MiniBlog.handlers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.code4j.MiniBlog.commons.utils.FastDFSClient;
import net.sf.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@Controller
@RequestMapping("/upload")
public class uploadHandler {

	@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL; // 图片服务器地址

	@RequestMapping("/blogImgUpload.do")
	@ResponseBody
	public String imagesUploadByFastDFS(@RequestParam MultipartFile Blogimage) {
		// 拼接返回数据，数据格式：
		/*
		 * { errno: 0, data: [ '图片1地址', '图片2地址', '……' ] }
		 */
		String data = "{errno: 0,data: [";
		try {
			// 初始化FastDFS客户端
			FastDFSClient fastDFSClient = new FastDFSClient("classpath:conf/client.conf");
			// 取文件扩展名
			String originalFilename = Blogimage.getOriginalFilename();
			String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			// 上传文件，得到图片地址和文件名
			String uploadResult = fastDFSClient.uploadFile(Blogimage.getBytes(), extName);
			// 补充为完整的请求URL
			String url = IMAGE_SERVER_URL + uploadResult;
			data = data + "'" + url + "',]}";

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 这里需要用JSONObject转一下String类型的数据，才能保证传回去的数据是json格式的
		JSONObject jsonObject = JSONObject.fromObject(data);
		
		return jsonObject.toString();
	}

	@RequestMapping("/blogImgUpload_OUT.do")
	public void imagesUpload(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("图片上传服务器 Staring......");
		String fileType = null; // 存放文件类型
		String finalFileName = null; // 存放最终文件全名
		// 拼接返回数据，数据格式：
		/*
		 * { errno: 0, data: [ '图片1地址', '图片2地址', '……' ] }
		 */
		String data = "{errno: 0,data: [";
		try {
			// 创建工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			File f = new File("E:\\MiniBlogFile");
			if (!f.exists()) {
				f.mkdirs();
			}
			// 设置文件上传的缓存路径
			factory.setRepository(f);
			// 创建Fileupload组件
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			fileUpload.setHeaderEncoding("utf-8");
			// 解析request
			List<FileItem> fileitems = fileUpload.parseRequest(request);
			// 遍历集合
			for (FileItem fileitem : fileitems) {
				// 判断是否为普通字段
				if (fileitem.isFormField()) {
					// 获得字段名和字段值
					// String name = fileitem.getFieldName();
					// String value = fileitem.getString("utf-8");
					// writer.print("提交者："+value+"<br>");
				} else {
					// 上传的文件路径
					String fileName = fileitem.getName();
					System.err.println("fileName = " + fileName);
					// 截取出文件名
					fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
					System.err.println("截取文件名 = " + fileName);
					// writer.print("成功上传文件："+fileName+"<br>");
					// 截取出文件类型
					fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
					System.err.println("文件类型 = " + fileType);
					// 对上传文件进行重命名
					// fileName = UUID.randomUUID().toString()+"_"+fileName;
					finalFileName = UUID.randomUUID().toString() + "." + fileType;
					fileName = "e:\\MiniBlogFiles\\BlogIMG\\" + finalFileName;
					// 在服务器创建同名文件
					File file = new File(fileName);
					file.getParentFile().mkdirs();
					file.createNewFile();
					// 获得上传文件流
					InputStream in = fileitem.getInputStream();
					// 获得写入文件流
					OutputStream out = new FileOutputStream(file);
					// 流的对拷
					byte[] buffer = new byte[1024];
					int len;
					while ((len = in.read(buffer)) > 0) {
						out.write(buffer, 0, len);
					}
					// 关流
					in.close();
					out.close();
					// 删除临时文件
					fileitem.delete();
					// 获取图片url地址
					String imgUrl = "http://localhost:8888/MiniBlogFiles/BlogIMG/" + finalFileName;
					// 拼接返回数据中部
					data = data + "'" + imgUrl + "',";
				}
			}
			// 拼接返回数据尾部
			data = data + "]}";
			response.setContentType("text/text;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 这里需要用JSONObject转一下String类型的数据，才能保证传回去的数据是json格式的
			JSONObject jsonObject = JSONObject.fromObject(data);
			out.print(jsonObject.toString()); // 返回url地址
			out.flush();
			out.close();

			System.err.println("图片上传服务器 Endding......");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
