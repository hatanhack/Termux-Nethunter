# kaliLinuxNethunter-termux
هذا سكريبت يسمح لك بتثبيت نظام Kali Nethunter (توزيعة لينكس Kali) داخل تطبيق Termux على هاتفك الأندرويد **دون الحاجة إلى صلاحيات الرووت (Rootless)**.

## خطوات التثبيت

نفّذ الأوامر التالية بالترتيب في نافذة Termux الطرفية لتثبيت الأداة. تم الفصل بين الأوامر بمسافة لتسهيل القراءة والنسخ:

```bash
pkg update && pkg upgrade -y
# لتحديث حزم Termux الأساسية.

pkg install git -y
# لتثبيت أداة Git، وهي ضرورية لاستنساخ المشروع.

git clone [https://github.com/hatanhack/kaliLinuxNethunter-termux.git](https://github.com/hatanhack/kaliLinuxNethunter-termux.git)
# لاستنساخ (تنزيل) السكريبت من مستودعك.

cd kaliLinuxNethunter-termux
# للانتقال والدخول إلى مجلد المشروع الذي تم تنزيله.

chmod +x kalinethunter
# لمنح سكريبت التثبيت صلاحية التشغيل.

./kalinethunter
# لتشغيل سكريبت التثبيت وبدء العملية.
