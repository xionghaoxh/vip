package com.vip.web.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;

@RestController
@RequestMapping("/api")
@Validated
public class AvaterController  {
    @Value("${account.avatar.saveDir}")
    private String saveDir;
    @PostMapping("/avater")
    public Object avater(MultipartFile file)throws Exception{
         if(Objects.isNull(file) || file.isEmpty()){
            throw  new NullPointerException("上传文件为空");
        }
        byte[] bytes = file.getBytes();
        Path path = Paths.get(saveDir+ file.getOriginalFilename());
         if(!Files.isWritable(path)){
             Files.createDirectories(Paths.get(saveDir));
         }
         Files.write(path,bytes);
         return "ok";
    }
}
