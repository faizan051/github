<?PHP

// Ensure cURL is active on server.
//echo 'Curl: ', function_exists('curl_version') ? 'Enabled' : 'Disabled';
//echo "<br /> <br />" ;

// Generating Random Order Number

//$orderId = rand() ;
// $_POST["b"] ;

if($_POST["x"] == null  ){
    echo "Something Went Wrong";
    die();
}

//echo $orderId . "<br>";
//echo $PayableAmount;

$requestBody = '{
    "apiOperation": "CREATE_CHECKOUT_SESSION",
    "interaction": {
        "operation": "PURCHASE"
    },
    "order": {
        "id" : "'.$orderId.'",
        "currency" : "PKR"
    }
}' ;



// $ch1 = curl_init();
// curl_setopt($ch1, CURLOPT_URL, "http://173.212.252.86:8086/api/FinanceKN/GetInstallmentDetailsByChallanNumber?challannumber=" .  $_POST["b"]);
// curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true) ;

// $headers1 = [
//     'Content-Type: application/json',
//     'cache-control: no-cache',
//     'Accept: application/json'// acceptance jason or XML or Plain text etc.
// ];

// curl_setopt($ch1, CURLOPT_HTTPHEADER, $headers1);
// $server1_output = curl_exec($ch1) ;
// curl_close ($ch1);
 
 
// $json1 = json_decode($server1_output, true) ;
//  var_dump($server1_output) ;
// // echo '<br>';
// // echo 'okokokok';
// // echo '<br>';
// //echo "Response from cURL request: <br />" ;
//  if($json1  == null){
//     echo "Challan Does Not Exist";
//     die();
//  }else{
//     if ($json1['PaidFlag']   == true) {
//         echo "Challan is already Paid";
//         die();
//     }else{
//         if ($json1['ClubbedChallanID']   != null) {
//             echo "Challan is Clubbed";
//             die();
//         }else{
//             $orderId = $json1['ChallanNumber'] ;
//             $PayableAmount = 2 ;
//         }
      
//     }
//  }
$orderId = $_POST['x'] ;
$PayableAmount = $_POST['y'] ;
// $PayableAmount = 2 ;
 


$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://test-mcbpk.mtf.gateway.mastercard.com/api/rest/version/56/merchant/MCBPK/session");//please add "TEST-" if you are on test account
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $requestBody) ;  //Post Fields
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true) ;

$headers = [
    'Authorization: Basic '.base64_encode("merchant.MCBPK:506ba44c797ebff3c7706d3330d67dae"),//merhcant ID and API password.
    'Content-Type: application/json',
    'Host: mcbpk.gateway.mastercard.com',
    'Referer: https://www.waqasurrehman.me/waqas', //Your referrer address
    'cache-control: no-cache',
    'Accept: application/json'// acceptance jason or XML or Plain text etc.
];

curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
$server_output = curl_exec($ch) ;
curl_close ($ch);


$json = json_decode($server_output, true) ;
//echo "Response from cURL request: <br />" ;
$sessionId = $json['session']['id'] ;

// Response from Server --- Must be 'success' to proceed further.
//print $server_output ;

//echo "<br /> <br />" ;

//echo "Session Id: ". $sessionId ;

//echo "<br /> <br />" ;

//echo "Order Id: ". $orderId ;

//echo "<br /> <br />" ;

?>


<html>
    <head>
        <!-- <script>
          window.open("http://localhost:3000/packageinfo" , '_blank').focus();
        </script> -->
        <script src="https://test-mcbpk.mtf.gateway.mastercard.com/checkout/version/56/checkout.js"
                data-error="errorCallback"
                data-cancel="cancelCallback"
                data-complete="completeCallback"
                data-beforeRedirect="getPageState"
                data-afterRedirect="restorePageState"
                data-timeout="timeoutCallback">
        </script>

        <script type="text/javascript">
            function errorCallback(error) {
                // alert("errorCallback function") ;
                alert("Something Went Wrong  ") ;
                console.log(JSON.stringify(error));
                   // window.open("http://173.212.252.86:8089/packageinfo", '_blank').focus();
                   localStorage.setItem('ChallanFromMCB', { "chNo" : JSON.stringify($('#orderId').val()) ,  "State" : "error" } ); 
                   window.open("http://localhost:3000/packageinfo", '_blank').focus();
                // document.getElementById("state").value = "errorCallback" ;
            }

            function cancelCallback() {
                alert("Payment cancelled ") ;
                console.log('Payment cancelled');
                localStorage.setItem('ChallanFromMCB', { "chNo" : JSON.stringify($('#orderId').val()) ,  "State" : "cancelled" } ); 
                   // window.open("http://173.212.252.86:8089/packageinfo", '_blank').focus();
                   window.open("http://localhost:3000/packageinfo", '_blank').focus();
              
            }

            function timeoutCallback() {
                alert("Payment timedout") ;
                console.log('Payment timedout');
                localStorage.setItem('ChallanFromMCB', { "chNo" : JSON.stringify($('#orderId').val()) ,  "State" : "timedout" } );               
                   // window.open("http://173.212.252.86:8089/packageinfo", '_blank').focus();
                   window.open("http://localhost:3000/packageinfo", '_blank').focus();
                
            }

            function completeCallback(resultIndicator, sessionVersion) {

               alert("completed Successfully") ;
               localStorage.setItem('ChallanFromMCB', { "chNo" : JSON.stringify($('#orderId').val()) ,  "State" : "Paid" } );               
                           // window.open("http://173.212.252.86:8089/packageinfo", '_blank').focus();
                        window.open("http://localhost:3000/packageinfo", '_blank').focus();

            //    currentRequest = jQuery.ajax({
			// 		type: "GET",
			// 		// url: "http://173.212.252.86:8086/api/FinanceKN/MarkFeeInstallmentAsPaidByGateway" ,
			// 		url: "http://172.16.20.173:8086/api/FinanceKN/MarkFeeInstallmentAsPaidByGateway" ,
			// 		data: "ChallanNumber=" + $('#orderId').val(),

			// 		success: function (data) {
            //             // window.open("http://173.212.252.86:8089/packageinfo", '_blank').focus();
            //             window.open("http://localhost:3000/packageinfo", '_blank').focus();
					 
			// 		}
			// 	});

                // document.getElementById("state").value = "completeCallback" ;
           }

          function getPageState() {

            //    alert("getPageState Callback: Leaving server.") ;
                
                return {
                    /* Fill other details */
                    orderId:<?php echo $orderId ; ?>,
                    amount:<?php echo $PayableAmount ; ?>,
                    // orderId: document.getElementById("orderId").value,
                    // amount: document.getElementById("amount").value,
                    // key01 : value
                    // key02 : value

                };
            }

            function restorePageState(data) {
                // alert("restorePageState Callback function called after " + document.getElementById("state").value + " function")  ;
                // alert("restorePageState" )  ;
                // alert("orderId: " + data.orderId + "\n amount: " + data.amount) ;
                // data.key01
                // data.key02
            }


            Checkout.configure({

                merchant: 'MCBPK',//merhacnt ID

                session: {
                    id: function() {
                        // return document.getElementById("sessionId").value;
                        return <?php echo $sessionId ; ?>;
                    }
                },

                order: {
                    amount: function() {
                        // return document.getElementById("amount").value;
                        return <?php echo $PayableAmount ; ?>;
                    },
                    currency: 'PKR',
                    description: 'Ordered goods',
                   id: function() {
                        // return document.getElementById("orderId").value;
                        return <?php echo $orderId ; ?>;
                    }
                },


                interaction: {
                    operation: 'PURCHASE',// set this field to 'PURCHASE' for <<checkout>> to perform a Pay Operation.
                    merchant: {
                        name: 'Aspire Group of Colleges',
                        address: {
                            line1: '200 Sample St',
                            line2: '1234 Example Town'            
                        }    
                    }
                }
            });
        </script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
  
                
    Checkout.showLightbox();
    // Checkout.showPaymentPage();
});
</script>
    </head>
    <body>

    <input type="hidden" id="orderId" name="orderId" value="<?php echo $orderId ; ?>">
    </body>
</html>