*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Open auction
    Open Browser    ${url_auction}    chrome
    
Choose role as user 
    Click Element   ${role_user}
    Wait Until Page Contains    Login as User    timeout=10s

Login as user
    Input Text      ${input_username}    ${user_username}
    Input Password  ${input_password}    ${user_password}
    Click Element   ${login_button}
    Wait Until Page Contains    Ajukan Barang    timeout=10s

Wrong user credentials
    Input Text      ${input_username}    ${wrong_user_username}
    Input Password  ${input_password}    ${wrong_user_password}
    Click Element   ${login_button}
    Alert Should Be Present    text=Username/Password salah!    action=ACCEPT
    Wait Until Page Contains    Login as User    timeout=10s
    
Wrong admin credentials
    Input Text      ${input_username}    ${wrong_admin_username}
    Input Password  ${input_password}    ${wrong_admin_password}
    Click Element   ${login_button}
    Alert Should Be Present    text=Username/Password salah!    action=ACCEPT
    Wait Until Page Contains    Login as Admin    timeout=10s

Submit item for auction
    Click Element    ${submit_auction}
    Input Text    ${input_item_name}    ${item_name}
    Input Text    ${input_item_description}   ${item_description}
    Input Text    ${input_start_price}    ${item_start_price}
    Input Text    ${input_buyout_price}    ${item_buyout_price}
    Choose File    ${input_item_image}    ${item_image}
    Click Element   xpath=//button[text()='Ajukan']
    Alert Should Be Present    text=Pengajuan berhasil!    action=ACCEPT
    Wait Until Page Contains    Ajukan Barang    timeout=10s

No start price 
    Click Element    ${submit_auction}
    Input Text    ${input_item_name}    ${item_name}
    Input Text    ${input_item_description}   ${item_description}
    Input Text    ${input_buyout_price}    ${item_buyout_price}
    Choose File    ${input_item_image}    ${item_image}
    Click Element   xpath=//button[text()='Ajukan']
    Should Not Be Empty    ${no_start_price} 

No buyout price 
    Click Element    ${submit_auction}
    Input Text    ${input_item_name}    ${item_name}
    Input Text    ${input_item_description}   ${item_description}
    Input Text    ${input_start_price}    ${item_start_price}
    Choose File    ${input_item_image}    ${item_image}
    Click Element   xpath=//button[text()='Ajukan']
    Should Not Be Empty    ${no_buyout_price} 

Non numeric start price
    Click Element    ${submit_auction}
    Input Text       ${input_item_name}    ${item_name}
    Input Text       ${input_item_description}    ${item_description}
    Input Text       ${input_start_price}    ${non_numeric}  
    Input Text       ${input_buyout_price}    ${item_buyout_price}
    Choose File      ${input_item_image}    ${item_image}
    Click Element    xpath=//button[text()='Ajukan']
    ${field_now}=    Get Element Attribute    ${input_start_price}    value
    Should Be Empty    ${field_now}

Buyout less than start price
    Click Element    ${submit_auction}
    Input Text       ${input_item_name}           ${item_name}
    Input Text       ${input_item_description}    ${item_description}
    Input Text       ${input_start_price}         ${item_start_price}
    Input Text       ${input_buyout_price}        ${bid_buyoutless}  
    Choose File      ${input_item_image}          ${item_image}
    Click Element    xpath=//button[text()='Ajukan']
    Alert Should Be Present    text=Harga buyout harus lebih besar dari harga awal!    action=ACCEPT
    Wait Until Page Contains    Ajukan Barang    timeout=10s

Minus price
    Click Element    ${submit_auction}
    Input Text       ${input_item_name}    ${item_name}
    Input Text       ${input_item_description}    ${item_description}
    Input Text       ${input_start_price}    ${minus_price} 
    Input Text       ${input_buyout_price}        ${item_buyout_price}
    Choose File      ${input_item_image}          ${item_image}
    Click Element    xpath=//button[text()='Ajukan']
    Alert Should Be Present    text=Harga tidak boleh minus!    action=ACCEPT
    Wait Until Page Contains    Ajukan Barang    timeout=10s

Null bid
    Click Element   ${try_bid}  
    Element Attribute Value Should Be    ${input_bid}    required    true
    Click Element   ${submit_bid}
    Should Not Be Empty    ${message_bid}  

Non numeric bid
    Click Element   ${try_bid}
    Input Text    ${input_bid}    ${non_numeric}
    Click Element   ${submit_bid}
    ${field_bid}=    Get Element Attribute    ${input_bid}    value
    Should Be Empty    ${field_bid}

Underprice bid
    Click Element   ${try_bid}
    Input Text  ${input_bid}     ${bid_underprice}
    Click Element   ${submit_bid}
    Alert Should Be Present    text=Gagal mengajukan bid! Pastikan bid mu lebih tinggi dari bid tertinggi!    action=ACCEPT
    Wait Until Page Contains    Ajukan Barang    timeout=10s

Normal bid
    Click Element    ${try_bid}
    Input Text  ${input_bid}     ${bid_normal}
    Click Element   ${submit_bid}
    Wait Until Page Contains    Detail Barang Lelang    timeout=10s

Under highest bid
    Click Element   ${try_bid}
    Input Text  ${input_bid}     ${bid_under_highest}
    Click Element   ${submit_bid}
    Alert Should Be Present    text=Gagal mengajukan bid! Pastikan bid mu lebih tinggi dari bid tertinggi!    action=ACCEPT
    Wait Until Page Contains    Ajukan Barang    timeout=10s

Buyout bid
    Click Element   ${try_bid}
    Input Text  ${input_bid}     ${bid_buyout}
    Click Element   ${submit_bid}
    Wait Until Page Does Not Contain    ${item_bid}     timeout=10s

Checkout
    Click Element    ${cart}  
    Click Element    ${payment_button}
    Alert Should Be Present    text=Pembayaran berhasil!!    action=ACCEPT                 
    Wait Until Location Does Not Contain    view-pembayaran-user.php    timeout=10s

Choose role as admin
    Click Element   ${role_admin}
    Wait Until Page Contains    Login as Admin    timeout=10s

Login as admin
    Input Text     ${input_username}    ${admin_username}
    Input Password  ${input_password}    ${admin_password}
    Click Element   ${login_button}
    Wait Until Page Contains    WELCOME ADMIN    timeout=10s

Cancel end auction
    Click Element    ${end_auction_button}
    Alert Should Be Present    text=Apakah Anda yakin ingin mengakhiri lelang?    action=DISMISS
    Wait Until Page Contains    DATA BARANG LELANG    timeout=10s

Confirm end auction
    Click Element    ${end_auction_button}
    Alert Should Be Present    text=Apakah Anda yakin ingin mengakhiri lelang?    action=ACCEPT
    Alert Should Be Present    text=Berhasil mengakhiri lelang!    action=ACCEPT
    Wait Until Page Contains    DATA BARANG LELANG    timeout=10s
    

Accept auctioned item
    Click Element    ${verify_submission}
    Click Element    ${accept_item}
    Alert Should Be Present    text=Apakah Anda yakin ingin menerima pengajuan?    action=ACCEPT
    Alert Should Be Present    text=Berhasil menerima pengajuan!    action=ACCEPT
    Wait Until Page Contains    VERIFIKASI PENGAJUAN BARANG    timeout=10s

Reject auctioned item
    Click Element    ${verify_submission}
    Click Element    ${reject_item}
    Alert Should Be Present    text=Apakah Anda yakin ingin menolak barang ini?    action=DISMISS
    Wait Until Page Contains    VERIFIKASI PENGAJUAN BARANG    timeout=10s


Confirm blacklist
    Click Element   ${user_list_menu}
    Click Element   ${delete_user}
    Alert Should Be Present    text=Apakah Anda yakin ingin menghapus user ini?    action=ACCEPT
    Wait Until Keyword Succeeds    3x    1s    Alert Should Be Present    text=Berhasil menghapus user!    action=ACCEPT

Cancel blacklist
    Click Element   ${user_list_menu}
    Click Element   ${delete_user}
    Alert Should Be Present    text=Apakah Anda yakin ingin menghapus user ini?    action=DISMISS
    Wait Until Page Contains    DATA USER    timeout=10s

New user
    Click Element   ${register_link}
    Input Text  ${input_username}   ${new_username}
    Input Password  ${input_password}   ${new_password}
    Input Text  ${input_bank}   ${new_bank}
    Click Element   ${register_button}
    Wait Until Page Contains    Welcome to CAREN's Auction    timeout=10s

Logout
    Click Element    xpath=//img[@alt='Logout']
    Wait Until Page Contains    Welcome to CAREN's Auction    timeout=10s
