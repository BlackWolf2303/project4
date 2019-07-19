# project4
Project Spring MVC kỳ cuối

1. Quản lý code với git và github: 
  * Cài đặt git (seach google), từ cửa sổ cmd/terminal kiểm tra máy đã có git chưa ( gõ git --version)
  * từ cmd/terminal cd đến thư mục muốn chứa project gõ : "git init"
  * clone project về máy tính : "git clone https://github.com/BlackWolf2303/project4.git"
  * sau khi clone xong, cd vào thư mục project4, show all branch mới clone về gõ : "git branch -a" 
  * chuyển qua branch develop, gõ : "git checkout develop". Thực hiện code trên branch này
  * Muốn up ngược lại github sau khi code xong gõ: "git pull" để update project, gõ tiếp "git push" để push lên github.
  (Nếu chưa biết làm thì click download file zip về để code)<br>
  Link template: https://drive.google.com/open?id=1X7T7ge6cIQhDcQ9i71Vr3Em54RdVgtyS


2. How to run this project: 
    * Import database vào SQL server hoặc My SQL trong xampp <br>
  Từ menu bar của Spring Tool Suite 4:
    * Project  --> clean 
    * Project --> Maven --> update project
    * Run as --> Spring Boot App
    * Sau khi server chạy xong, truy cập localhost:[port hiển thị trên console]

3. yêu cầu chung: 
    * Tạo 1 controller tương ứng với 1 page, tất cả các điều hướng trong page nào thì viết @RequestMapping trong controller tương ứng.
    * 

4. Link page đã immigrate:
      /             : Trang chủ <br>
      /categories   : Danh mục sản phẩm <br>
      /blog         : Khám phá <br>
      /about        : Về chúng tôi <br>
      /contact      : Liên hệ <br>
      /product      : Chi tiết sp <br>

5. Revert đến lần commit cuối hoặc commit bất kỳ
 * Gõ `git log` để hiện thị danh sách các mã hash của các lần commit
 * Tìm và copy <hash code> lần commit cuối hoặc lần commit nào cần revert
 * Nếu ko nhớ phần code cần revert nằm trong commit nào, dùng lệnh `git checkout <hash code> Để kiểm tra xem có phải commit mình cần ko. Nếu đã biết lần commit nào thì bỏ qua bước này
 * Revert đến lần commit cần: `git revert <hash code>`. Sau lệnh này, git sẽ tạo ra 1 commit mới đã bao gồm phần code vừa revert.
 * gõ `git checkout <branch cần làm việc>` (thường là develop). 
 Xong! 
 
 6. Ví dụ có 3 file A, B, C. Nếu đã lỡ gõ `git add .` 
  * Muốn gỡ tất cả các file ra khỏi vùng add , gõ `git reset . `
  * Muốn gỡ 1 file cụ thể , ví dụ file B. Gõ `git reset B`
  * Nếu vẫn ko được, gõ `git status` để hiển thị các file (dạng link màu xanh lá) đã add. Copy nguyên link màu xanh của file nào cần gỡ và gõ : `git reset <paste link file vừa copy vô>` 
Xong!
