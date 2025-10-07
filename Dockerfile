# ===============================
# 🧱 Base image: Apache Tomcat 9 + JDK 17
# ===============================
FROM tomcat:9.0-jdk17

# ===============================
# ⚙️ Cấu hình biến môi trường Render (PORT)
# ===============================
ENV PORT=8080

# ===============================
# 🧹 Xóa webapp mặc định của Tomcat
# ===============================
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# ===============================
# 📦 Copy file WAR đã build sẵn
# ===============================
# ⚠️ Đảm bảo file .war đúng tên (đặt ở thư mục gốc của repo)
COPY ch14_ex1_email_war.war /usr/local/tomcat/webapps/ROOT.war

# ===============================
# 🌐 Cấu hình cổng (Render yêu cầu PORT)
# ===============================
EXPOSE 8080

# ===============================
# 🚀 Lệnh khởi động (foreground mode)
# ===============================
CMD ["catalina.sh", "run"]
