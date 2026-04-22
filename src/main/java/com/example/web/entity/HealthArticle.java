package com.example.web.entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.apache.poi.hpsf.Decimal;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import java.sql.Date;
import java.sql.Timestamp;
import lombok.Data;
import java.time.LocalDateTime;
import com.example.web.dto.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
/**
 * 健康知识表
 */
@Data
@TableName("`HealthArticle`")
public class HealthArticle extends BaseEntity {

      
  	  /**
     * 标题
     */  
    @JsonProperty("Title")
    @TableField(value="Title",updateStrategy = FieldStrategy.IGNORED)
    private String Title;
      
    /**
     * 分类
     */  
    @JsonProperty("HealthArticleTypeId")
    @TableField(value="HealthArticleTypeId",updateStrategy = FieldStrategy.IGNORED)
    private Integer HealthArticleTypeId;          
      
  	  /**
     * 封面
     */  
    @JsonProperty("Cover")
    @TableField(value="Cover",updateStrategy = FieldStrategy.IGNORED)
    private String Cover;
      
    /**
     * 发布人
     */  
    @JsonProperty("PublishUserId")
    @TableField(value="PublishUserId",updateStrategy = FieldStrategy.IGNORED)
    private Integer PublishUserId;          
      
    /**
     * 内容
     */  
    @JsonProperty("Content")
     @TableField(value="Content",updateStrategy = FieldStrategy.IGNORED)
    private String Content;
      
    /**
     * 浏览量
     */  
    @JsonProperty("ViewCount")
    @TableField(value="ViewCount",updateStrategy = FieldStrategy.IGNORED)
    private Integer ViewCount;          
      
    /**
     * 审核状态
     */  
    @JsonProperty("AuditStatus")
    @TableField(value="AuditStatus",updateStrategy = FieldStrategy.IGNORED)
    private Integer AuditStatus;          
      
    /**
     * 审核时间
     */  
    @JsonProperty("AuditTime")
    @TableField(value="AuditTime",updateStrategy = FieldStrategy.IGNORED)
    @JsonSerialize(using= LocalDateTimeSerializer.class)
    @JsonDeserialize(using= LocalDateTimeDeserializer.class)
    private LocalDateTime AuditTime;             
      
    /**
     * 审核人
     */  
    @JsonProperty("AuditUserId")
    @TableField(value="AuditUserId",updateStrategy = FieldStrategy.IGNORED)
    private Integer AuditUserId;          
  
    /**
     * 把健康知识实体转换成健康知识传输模型
     */
    public HealthArticleDto MapToDto() throws InvocationTargetException, IllegalAccessException {
        HealthArticleDto HealthArticleDto = new HealthArticleDto();
       
        BeanUtils.copyProperties(HealthArticleDto,this);
       
        return HealthArticleDto;
    }

}
