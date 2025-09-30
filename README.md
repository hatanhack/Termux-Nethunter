# Termux-Nethunter by HatanHack

هذا سكريبت تم تطويره خصيصًا لتثبيت بيئة **Kali Nethunter (Kali Linux)** الكاملة داخل تطبيق **Termux** على هاتفك الأندرويد، **دون الحاجة إلى صلاحيات الروت** (Root).

### 🚀 خطوات التثبيت

تأكد من وجودك في مجلد **HOME** في Termux قبل البدء.

1.  **تنزيل السكريبت:**
    ```bash
    curl -LO [https://raw.githubusercontent.com/HatanHack/Termux-Nethunter/master/kalinethunter.sh](https://raw.githubusercontent.com/HatanHack/Termux-Nethunter/master/kalinethunter.sh)
    ```
2.  **منح صلاحيات التنفيذ:**
    ```bash
    chmod +x kalinethunter.sh
    ```
3.  **تشغيل التثبيت:**
    ```bash
    ./kalinethunter.sh
    ```

### 💻 الاستخدام الأساسي

1.  **بدء Nethunter:**
    استخدم الأمر `startkali`. المستخدم الافتراضي هو **`kali`** وكلمة المرور الافتراضية هي أيضًا **`kali`**.
2.  **بدء بصلاحيات الروت:**
    إذا أردت بدء Nethunter كمستخدم Root، استخدم الأمر `startkali -r`.

### 🖼️ دليل VNC (الواجهة الرسومية)

تساعدك الأوامر التالية في إدارة جلسات الواجهة الرسومية (VNC) للوصول إلى بيئة سطح المكتب.

| الأمر | الوصف |
| :--- | :--- |
| `vnc start` | لبدء جلسة VNC جديدة. |
| `vnc stop` | لإيقاف جميع جلسات VNC النشطة. |
| `vnc status` | للتحقق من حالة الجلسات النشطة (يعرض رقم الشاشة والمنفذ). |

**ملاحظة المنفذ:**
* إذا كان المستخدم **`kali`**، ستبدأ الجلسة افتراضيًا على `DISPLAY=:2` (منفذ: `5902`).
* إذا كان المستخدم **`root`**، ستبدأ الجلسة افتراضيًا على `DISPLAY=:1` (منفذ: `5901`).

### ⚠️ حل مشكلة SSL

في حالة ظهور خطأ: **`SSL error: certificate verify failed`** أثناء التنزيل:

أعد تشغيل السكريبت مع المعامل الإضافي `--insecure`:
```bash
./kalinethunter.sh --insecure
