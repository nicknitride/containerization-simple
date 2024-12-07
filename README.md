# Misc. Info

- I installed MySQL using this [link](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04) 

- This project is using **vite + vanilla javascript**

## Run Instructions (Frontend)
Pre-requisites:
- Node >= v18.0
```sh
npm install 
npm run dev
```
## Run Instructions (Backend)
Location: /backend/

Pre-requisites:
- MySQL and Node
```sh
cd backend
npm install 
npm run server
```

# Database Config
- Default port number: **3000**
- Allows access to the database from the terminal (WSL)
> Follow the setup steps in the link above or find one for Mac or Windows
## To Initialize the db:
```
sudo mysql -u root -p
create database iteratedb;
use iteratedb;
```
### Create table entries:
```
CREATE TABLE IF NOT EXISTS button (
  id INT PRIMARY KEY,      -- The unique identifier for each button
  value INT NOT NULL       -- The value of the button
);
-- Insert initial button data with value 0
INSERT INTO button (id, value) VALUES (1, 0);
```

# TODO:
1. Containerize backend and the frontend code separately
2. Test images and then upload to cloudrun or wherever else
3. Test kubernetes 
- May need to adjust api endpoints and ports to work with the code