cd desktop
sudo cp build/bin/Paisa build/linux/usr/local/bin
sudo cp -r build/linux/ paisa_0.5.5_amd64
sudo dpkg --build paisa_0.5.5_amd64
cd ..
sudo mv desktop/paisa_0.5.5_amd64.deb paisa-app-linux-amd64.deb
sudo chmod +x paisa-app-linux-amd64.deb
sudo dpkg -i paisa-app-linux-amd64.deb
# sudo cp /usr/local/bin/Paisa /home/lgili/Documents/personal-accounting/paisa/