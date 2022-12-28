## Part 1. Готовый докер  
#### 1) Взять официальный докер образ с nginx и выкачать его при помощи docker pull  
* используем команду `sudo docker pull nginx`  
![Part_1_1.jpg](Screenshots/Part_1_1.jpg)  

#### 2) Проверить наличие докер образа через docker images  
* используем команду `sudo docker images`  
![Part_1_2.jpg](Screenshots/Part_1_2.jpg)  

#### 3-4) Запустить докер образ через `docker run -d [image_id|repository]` и проверить что образ запустился через `docker ps`  
* используем команду `sudo docker run -d nginx` и проверяем, что образ запустился с помощью команды `sudo docker ps`  
![Part_1_3-4.jpg](Screenshots/Part_1_3-4.jpg)  

#### 5) Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`  
* используем команду `sudo docker inspect recursing_almeida`  
![Part_1_5.jpg](Screenshots/Part_1_5.jpg)  

#### 6) По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера  
* найдём размер контейнера командой `sudo docker inspect recursing_almeida --size | grep -i SizeRw`  
![Part_1_6_1.jpg](Screenshots/Part_1_6_1.jpg)  


* найдём в выводе команды `sudo docker inspect recursing_almeida` список портов  
![Part_1_6_2.jpg](Screenshots/Part_1_6_2.jpg)  


* найдём ip контейнера командой `sudo docker inspect recursing_almeida --size | grep -i ip`  
![Part_1_6_3.jpg](Screenshots/Part_1_6_3.jpg)  
Отдельно замечу, что флаг `--size` здесь необязателен. У меня он остался из-за вызова предыдущей команды.  

#### 7-8) Остановить докер образ через `docker stop [container_id|container_name]` и проверить, что образ остановился через `docker ps`  
* используем команду `sudo docker stop recursing_almeida` и проверяем остановку командой `sudo docker ps`  
![Part_1_7-8.jpg](Screenshots/Part_1_7-8.jpg)  

#### 9) Запустить докер с замапленными портами 80 и 443 на локальную машину через команду `run`  
* используем команду `sudo docker run -d -p 8-:80 -p 443:443 nginx` и сразу проверим запуск и порты командой `sudo docker ps`  
![Part_1_9.jpg](Screenshots/Part_1_9.jpg)  

#### 10) Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx  
* Открываем любой браузер и в адресной строке пишем localhost:80  
![Part_1_10.jpg](Screenshots/Part_1_10.jpg)  

#### 11-12) Перезапустить докер контейнер через `docker restart [container_id|container_name]` и проверить любым способом, что контейнер запустился  
* перезапускаем контейнер командой `sudo docker restart great_chaplygin` и проверяем запуск командой `sudo docker ps`  
![Part_1_11-12.jpg](Screenshots/Part_1_11-12.jpg)  

## Part 2. Операции с контейнером  
#### 1) Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду `exec`  
* используем команду `sudo docker exec great_chaplygin cat /etc/nginx/nginx.conf`  
![Part_2_1.jpg](Screenshots/Part_2_1.jpg)  

#### 2) Создать на локальной машине файл nginx.conf  
* создаём файл  
![Part_2_2.jpg](Screenshots/Part_2_2.jpg)  

#### 3) Настроить в нем по пути /status отдачу страницы статуса сервера nginx  
* дописываем блок http  
![Part_2_3.jpg](Screenshots/Part_2_3.jpg)  
также потребовалось закомментировать `include /etc/nginx/conf.d/*.conf`, потому что с этой строкой не отображалась страница status.  

#### 4-5) Скопировать созданный файл nginx.conf внутрь докер образа через команду `docker cp` и Перезапустить nginx внутри докер образа через команду `exec`  
* копируем файл командой `sudo docker cp nginx.conf great_chaplygin:etc/nginx/` и перезапускаем nginx командой `sudo docker exec great_chaplygin nginx -s reload`  
![Part_2_4-5.jpg](Screenshots/Part_2_4-5.jpg)  

#### 6) Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx  
* открываем браузер и проверяем  
![Part_2_6.jpg](Screenshots/Part_2_6.jpg)  

#### 7) Экспортировать контейнер в файл container.tar через команду export  
* экспортируем контейнер командой `sudo docker export -o cnt.tar great_chaplygin  `
![Part_2_7.jpg](Screenshots/Part_2_7.jpg)  

#### 8) Остановить контейнер  
* останавливаем контейнер командой `sudo docker stop great_chaplygin`  
![Part_2_8.jpg](Screenshots/Part_2_8.jpg)  

#### 9) Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры  
* удаляем образ командой `sudo docker rmi -f nginx`  
![Part_2_9.jpg](Screenshots/Part_2_9.jpg)  

#### 10) Удалить остановленный контейнер  
* удаляем контейнер командой `sudo docker rm great_chaplygin`  
![Part_2_10.jpg](Screenshots/Part_2_10.jpg)  

#### 11) Импортировать контейнер обратно через команду import  
* используем команду `sudo docker import -c 'CMD ["nginx", "-g", "daemon off;"]' cnt.tar test`  
![Part_2_11.jpg](Screenshots/Part_2_11.jpg)  

#### 12) Запустить импортированный контейнер  
* запускаем контейнер командой `sudo docker run -d -p 80:80 -p 443:443 test`  
![Part_2_12.jpg](Screenshots/Part_2_12.jpg)  

#### 13) Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx  
* открываем браузер и смотрим  
![Part_2_13.jpg](Screenshots/Part_2_13.jpg)