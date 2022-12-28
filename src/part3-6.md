## Part 3. Мини веб-сервер  
* Пишем мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью `Hello World!`  
![Part_3_1.jpg](Screenshots_for_part_3-6/Part_3_1.jpg)  


* Пишем свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080  
![Part_3_2.jpg](Screenshots_for_part_3-6/Part_3_2.jpg)  


* Качаем образ nginx, запускаем контейнер, копируем c файл сервера и conf файл nginx  
![Part_3_1.jpg](Screenshots_for_part_3-6/Part_3_3.jpg)  


* Заходим в контейнер командой `docker exec -it intelligent_meninsky bash`, обновляем репозитории, устанавливаем gcc, spawn-fcgi и libfcgi-dev  
![Part_3_4.jpg](Screenshots_for_part_3-6/Part_3_4.jpg)  


* Компилируем и запускаем сервер  
![Part_3_5.jpg](Screenshots_for_part_3-6/Part_3_5.jpg)  


* проверяем нашу страничку  
![Part_3_6.jpg](Screenshots_for_part_3-6/Part_3_6.jpg)  

## Part 4. Свой докер  
* Создаём докерфайл  
![Part_4_1.jpg](Screenshots_for_part_3-6/Part_4_1.jpg)  


* Создаём скрипт, выполняющий роль entrypoint  
![Part_4_2.jpg](Screenshots_for_part_3-6/Part_4_2.jpg)  


* Собираем образ через `docker build` при этом указав имя и тег  
![Part_4_4.jpg](Screenshots_for_part_3-6/Part_4_4.jpg)  


* проверяем через `docker images`, что все собралось корректно  
![Part_4_5.jpg](Screenshots_for_part_3-6/Part_4_5.jpg)  


* прежде чем запускать вытащим из образа папку nginx для последующего маппинга  
![Part_4_3.jpg](Screenshots_for_part_3-6/Part_4_3.jpg)  
![Part_4_6.jpg](Screenshots_for_part_3-6/Part_4_6.jpg)  


* Запускаем собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а  
![Part_4_7.jpg](Screenshots_for_part_3-6/Part_4_7.jpg)  


* проверяем в браузере  
![Part_4_8.jpg](Screenshots_for_part_3-6/Part_4_8.jpg)  


* Дописываем в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx  
![Part_4_9.jpg](Screenshots_for_part_3-6/Part_4_9.jpg)  


* Перезапускаем докер образ, проверяем, заглядываем в браузер  
![Part_4_12.jpg](Screenshots_for_part_3-6/Part_4_12.jpg)  
![Part_4_10.jpg](Screenshots_for_part_3-6/Part_4_10.jpg)  
![Part_4_11.jpg](Screenshots_for_part_3-6/Part_4_11.jpg)  

## Part 5. Dockle  
* сперва установим доклю  
![Part_5_1.jpg](Screenshots_for_part_3-6/Part_5_1.jpg)  


* потом проверим образ  
![Part_5_2.jpg](Screenshots_for_part_3-6/Part_5_2.jpg)  


* Понимаем, что с ошибкой CIS-DI-0010 никак не разобраться, даже сменой версии nginx, и пересаживаемся на ubuntu/nginx  
* переписываем докерфайл  
![Part_5_4.jpg](Screenshots_for_part_3-6/Part_5_4.jpg)  


* переписываем nginx.config, потому что он теперь новый  
![Part_5_3.jpg](Screenshots_for_part_3-6/Part_5_3.jpg)  


* билдим, проверяем и радуемся, что обошлись без заглушек  
![Part_5_5.jpg](Screenshots_for_part_3-6/Part_5_5.jpg)  

## Part 6. Базовый Docker Compose  
* Перепишем скрипт entrypoint для второго контейнера, иначе он будет завершать работу после `docker-compose up`  
![Part_6_1.jpg](Screenshots_for_part_3-6/Part_6_1.jpg)  


* Перепишем _**nginx.conf**_ для проксирования  
![Part_6_2.jpg](Screenshots_for_part_3-6/Part_6_2.jpg)  


* добавим пользователя в группу root  
![Part_6_3.jpg](Screenshots_for_part_3-6/Part_6_3.jpg)  


* напишем **_docker-compose.yml_**  
![Part_6_4.jpg](Screenshots_for_part_3-6/Part_6_4.jpg)  


* билдим командой `sudo docker-compose build` и запускаем командой `sudo docker-compose up` наш docker-compose  
![Part_6_5.jpg](Screenshots_for_part_3-6/Part_6_5.jpg)  


* проверяем работу  
![Part_6_6.jpg](Screenshots_for_part_3-6/Part_6_6.jpg)  


* и, на всякий случай, в браузере  
![Part_6_7.jpg](Screenshots_for_part_3-6/Part_6_7.jpg)  
![Part_6_8.jpg](Screenshots_for_part_3-6/Part_6_8.jpg)  
