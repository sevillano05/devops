# Importar el módulo de IIS
Import-Module WebAdministration

# Configurar la página predeterminada
Set-WebConfiguration -Filter '/system.webServer/defaultDocument/files/add[@value="index.html"]' -PSPath 'IIS:\' -Location 'Default Web Site' -Value @{value='index.html'}

# Asegurarse de que index.html esté en la lista de documentos predeterminados
Add-WebConfiguration -Filter '/system.webServer/defaultDocument/files' -PSPath 'IIS:\' -Location 'Default Web Site' -Value @{value='index.html'}

# Reiniciar el sitio web
Restart-WebItem 'IIS:\Sites\Default Web Site'