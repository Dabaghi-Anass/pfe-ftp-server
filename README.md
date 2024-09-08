# pfe-ftp-server
ftp server docker compose file to deploy an ftp server

## How to use
1. Clone the repository
2. Specify The Following Environment Variables
```bash
export FTP_USER=ftpuser
export FTP_PASSWORD=ftppassword
export FTP_PORT=21
export FTP_HOME=/home/data-directories
```
3. Run the following command
```bash
docker build -t custom-ftp-server .
docker run -d -p 21:21 -p 30000-30009:30000-30009 -e FTP_USER=$FTP_USER -e FTP_PASSWORD=$FTP_PASSWORD -e FTP_PORT=$FTP_PORT -e FTP_HOME=$FTP_HOME custom-ftp-server
```
3. Connect to the ftp server using the following credentials
```bash
ftp localhost
```

Upload file using curl command
```bash
curl -T file.txt ftp://localhost --user ftpuser:ftppassword --ftp-pasv
```

Download file using curl command
```bash
curl -o file.txt ftp://localhost/file.txt --user ftpuser:ftppassword --ftp-pasv
```
List files using curl command
```bash
curl ftp://localhost --user ftpuser:ftppassword --ftp-pasv
```
