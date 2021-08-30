import 'package:flutter/material.dart';

Color primaryBlack = Color(0xff202c3b);

class DataSource {
  static String note = "Chung tay tránh xa bệnh dịch";

static List questionAnswers = [
    {
      "question": "Virus Corona là gì?",
      "answer":
          "Virus Corona là chủng virus mới chưa từng xuất hiện ở người, có tên gọi từ nguồn gốc tiếng Latin. Vi rút Corona là chủng virus được bao bọc bằng những chiếc gai bao bọc bên ngoài, tương tác với thụ thể trên tế bào, theo cơ chế tương tự chìa khóa và ổ khóa, từ đó cho phép virus xâm nhập vào bên trong."
    },
    {
      "question": "Covid 19 là gì?",
      "answer":    
          "Tổ chức Y tế Thế giới (WHO) cho biết tên gọi chính thức của bệnh viêm đường hô hấp cấp do chủng mới của vi-rút corona (nCoV) là Covid 19. Tên gọi mới này gọi tắt của coronavirus disease 2019"  },
   
    {
      "question": "Virus corona chủng mới là gì?",
      "answer":
        "Virus Corona 2019 là một loại virus gây ra tình trạng nhiễm trùng trong mũi, xoang hoặc cổ họng. Có 7 loại virus Corona, trong đó, 4 loại không nguy hiểm là 229E, NL63, OC43 và HKU1; hai loại khác là MERS-CoV và SARS-CoV nguy hiểm hơn và từng gây ra đại dịch toàn cầu. Bên cạnh đó, còn một loại virus Corona thuộc chủng mới (màu vàng) ký hiệu 2019-nCoV hoặc nCoV"    
       },
    {
      "question": "Virus Corona gây bệnh như thế nào?",
      "answer":
       "Hầu hết các loại virus Corona có con đường lây truyền giống như những loại virus gây cảm lạnh khác, đó là Người bệnh ho và hắt hơi mà không che miệng, dẫn tới phát tán các giọt nước vào không khí, làm lây lan virus sang người khỏe mạnh,người khỏe mạnh chạm hoặc bắt tay với người có virus Corona khiến virus truyền từ người này sang người khác,người khỏe mạnh tiếp xúc với một bề mặt hoặc vật thể có virus, sau đó đưa tay lên mũi, mắt hoặc miệng của mình,những trường hợp hiếm hoi, virus Corona có thể lây lan qua tiếp xúc với phân."
         },
    {
      "question":
          "Thời gian ủ bệnh virus Corona?",
      "answer":
          "Một người nhiễm virus Corona có thể xuất hiện các triệu chứng đầu tiên sau thời gian ủ bệnh khoảng 2-14 ngày, trung bình là 5 ngày. Trong thời gian ủ bệnh, virus vẫn có thể lây truyền gây nhiễm bệnh. VNVC đã chuẩn bị sẵn 1 bài viết về thời gian ủ bệnh virus Corona cho bạn tham khảo."
           },
    {
      "question": "Can CoVID-19 be caught from a person who has no symptoms?",
      "answer":
          "The main way the disease spreads is through respiratory droplets expelled by someone who is coughing. The risk of catching COVID-19 from someone with no symptoms at all is very low. However, many people with COVID-19 experience only mild symptoms. This is particularly true at the early stages of the disease. It is therefore possible to catch COVID-19 from someone who has, for example, just a mild cough and does not feel ill.  WHO is assessing ongoing research on the period of transmission of COVID-19 and will continue to share updated findings.    "
    },
    {
      "question":
          "Triệu chứng vi rút Corona qua từng ngày",
      "answer":
         "Bác sĩ Trương Hữu Khanh cảnh báo: “Virus Corona chủng 2019-nCoV đặc biệt nguy hiểm với những người có hệ miễn dịch yếu, người lớn tuổi, trẻ em, những người có hệ miễn dịch yếu hoặc có bệnh lý nền mãn tính như bệnh tim, bệnh phổi mạn tính, suy giảm miễn dịch, béo phì, đái tháo đường… Những đối tượng này có khả năng lây nhiễm cao, khó điều trị do bệnh lý diễn biến nhanh, nguy hiểm tính mạng. Đặc biệt, virus Corona cực kỳ nguy hiểm cho phụ nữ có thai. Khi phụ nữ có thai mắc bệnh sẽ để lại những hậu quả đặc biệt nghiêm trọng. Mức độ nguy hiểm của bệnh lý này với phụ nữ có thai tương tự như mức độ của dịch bệnh MERS năm 2014.”"  
         },
    {
      "question": "Biểu hiện sớm nhất của bệnh virus corona là gì?",
      "answer":
          "Sốt, ho khan, mệt mỏ" },
    {
      "question": "Covid 19 sốt bao nhiêu độ?",
      "answer":
          "Sau thời gian ủ bệnh (trong khoảng từ 2 đến 14 ngày), các triệu chứng nhiễm Covid 19 bắt đầu xuất hiện như ho khan và sốt nhẹ. Sốt được xác định nghi ngờ Covid 19 là từ 38,1oC – 39oC hay 100,5oF – 102,1oF, thường kèm theo giảm chức năng vị giác và khứu giác." },
    {
      "question": "Triệu chứng virus covid-19 có nghẹt mũi không?",
      "answer":
         "Theo báo cáo của Tổ chức Y tế Thế giới (WHO), khoảng 5% bệnh nhân mắc Corona virus có triệu chứng nghẹt mũi. Đây không phải là dấu hiệu phổ biến nhất của bệnh, nhưng đây là triệu chứng dễ gây nhầm lẫn với cảm lạnh và cúm. Trên thực tế, nhiều dấu hiệu Covid 19 giống với bệnh cúm như đau đầu, đau nhức cơ thể, mệt mỏi. Một số triệu chứng khác có thể giống như cảm lạnh hoặc dị ứng, như đau họng, ho, sốt và nghẹt mũi."  },
    {
      "question":
          "Cách ly và giãn cách xã hội",
      "answer":
         "Cách ly xã hội (Social distancing) là biện pháp nhằm ngăn chặn hoặc làm giảm sự lây lan của virus Sars-Cov-2. Mục tiêu của cách ly xã hội là giảm khả năng tiếp xúc giữa người nhiễm bệnh và những người không bị nhiễm bệnh, giảm nguy cơ lây truyền bệnh, nhiễm bệnh và cuối cùng là tử vong." }
  ];
}
