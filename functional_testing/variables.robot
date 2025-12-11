*** Variables ***
${url_auction}    http://localhost/tr_auction/tr_pw/tr_pw-main/TR/frontend/view-form-login.php
${role_user}    xpath=//input[@value='User']
${role_admin}    xpath=//input[@value='Admin']

${user_username}    felicia_wijaya
${user_password}    felicia1234

${admin_username}    admin123
${admin_password}    iniadmin123

${new_username}    newuser02
${new_password}    newpassword02
${new_bank}    1234567890

${wrong_user_username}    cobauser
${wrong_user_password}    salahuser

${wrong_admin_username}    cobaadmin
${wrong_admin_password}    salahadmin

${item_name}    Toyota Veloz 2023
${item_description}    Toyota Veloz 2023 dalam kondisi sangat terawat dengan tampilan modern, kabin lega, dan kenyamanan berkendara yang halus. 
${item_start_price}    175000000
${item_buyout_price}    250000000
${item_image}    D:/Semester 5/Pengujian Sistem/TAS/functional_testing/resources/veloz2023.jpeg
${bid_buyoutless}    160000000
${minus_price}   -1

${bid_normal}   110000000
${bid_underprice}   90000000
${bid_under_highest}    105000000
${bid_buyout}    120000000
${non_numeric}    one hundred million

${no_start_price}=    Execute Javascript    return document.querySelector('#nmbHargaAwal').validationMessage
${no_buyout_price}=    Execute Javascript    return document.querySelector('#nmbHargaBuyout').validationMessage

${message_bid}=    Execute Javascript    return document.querySelector('#bid_amount').validationMessage != 'Please fill out this field.'

${input_username}    id=username
${input_password}    id=password
${login_button}    xpath=//input[@value='Login']

${submit_auction}    xpath=//a[contains(text(), 'Ajukan Barang')]
${input_item_name}    id=txtNamaBarang
${input_item_description}   id=txtDeskripsiBarang
${input_start_price}    id=nmbHargaAwal
${input_buyout_price}   id=nmbHargaBuyout
${input_item_image}     id=imgFotoBarang

${item_bid}    Honda Jazz
${try_bid}  xpath=//img[@alt='Gambar Honda Jazz']
${input_bid}    id=bid_amount
${submit_bid}   xpath=//button[text()='Ajukan Bid']

${cart}                xpath=//a[@href='view-pembayaran-user.php']
${payment_button}           xpath=//button[contains(@class, 'btn-bayar-btn')]

${end_auction_button}       xpath=//button[text()='Akhiri Lelang']
${verify_submission}   xpath=//a[contains(text(), 'Verifikasi Pengajuan')]
${accept_item}       xpath=(//a[contains(@class, 'accept-btn')])[1]
${reject_item}       xpath=(//a[contains(@class, 'reject-btn')])[1]

${user_list_menu}           xpath=//a[contains(text(), 'Data User')]
${delete_user}       xpath=(//a[contains(@class, 'delete-btn')])[15]

${register_link}            xpath=//a[text()="Register here"]
${input_bank}       id=norek
${register_button}          xpath=//input[@value='Register']
