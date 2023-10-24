# npm install  # run as normal user
# npm run build # run as normal user
# go build # run as normal user
# nix-build ledger.nix
# cp ./result/bin/ledger internal/binary/ledger
cd desktop
go install github.com/wailsapp/wails/v2/cmd/wails@latest
# wails doctor
wails build #-tags webkit2_40
cp build/bin/Paisa build/linux/usr/local/bin
cp -r build/linux/ paisa_0.5.5_amd64
dpkg --build paisa_0.5.5_amd64
cd ..
sudo mv desktop/paisa_0.5.5_amd64.deb paisa-app-linux-amd64.deb
chmod +x paisa-app-linux-amd64.deb
sudo dpkg -i paisa-app-linux-amd64.deb
# sudo cp /usr/local/bin/Paisa /home/lgili/Documents/personal-accounting/paisa/