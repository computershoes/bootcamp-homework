#### 1. Code Injection  
![Code Injection](https://github.com/spodw/bootcamp-homework/blob/main/week-15/img/command_injection.png)  
To mitigate against command injection, I recommend using existing APIs for functions of the web application, rather than OS commands.
I also recommend implementing input validation by whitelisting acceptable characters.  

#### 2. Brute Force  
![Brute Force](https://github.com/spodw/bootcamp-homework/blob/main/week-15/img/brute_force.png)  
To mitigate against brute force attacks, I recommend allowing only a limited number of failed login attempts before account lockout.
Increasing delay between failed login attempts, strong password requirements, and using an IDS can also increase protection agains brute force attacks.

#### 3. BeEF Hook  
![BeEF Hook](https://github.com/spodw/bootcamp-homework/blob/main/week-15/img/beef.png)  
To mitigate against browser-hooking, I recommend taking measures to prevent cross site scripting. 
This includes filtering user inputs with whitelists, input sanitization and utilizing network based IDS/IPS.
