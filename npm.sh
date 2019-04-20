mkdir -p -m a+rwX ~/backend/node_modules
mkdir -p -m a+rwX /vagrant/backend/node_modules
sudo mount --bind ~/backend/node_modules /vagrant/backend/node_modules
cd /vagrant/backend
npm install
mkdir -p -m a+rwX ~/frontend/node_modules
mkdir -p -m a+rwX /vagrant/frontend/node_modules
sudo mount --bind ~/frontend/node_modules /vagrant/frontend/node_modules
cd /vagrant/frontend
npm install
