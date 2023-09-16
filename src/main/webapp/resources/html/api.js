

// 결제 api
$("#creditBtn").click(function () {

    if(!yes.checked){
        alert("약관 동의 후 진행해주세요");
        return;
    } else {

        IMP.init('imp06854558'); 
        IMP.request_pay({
        pg: "inicis",
        pay_method: "card",
        merchant_uid : 'merchant_'+new Date().getTime(),
        name : 'mungMate',
        amount : '10000',
        buyer_email : 'choiyonghyuk97@gmail.com',
        buyer_name : '우리 멍메이트',
      }, function (rsp) { // callback
          if (rsp.success) {
            // 결제 성공 시 로직,
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;

            const data = { "amount" : realPrice.value,
                    "useMile" : useMile1.value,
                    "prePrice" : prePrice.value };


            // ajax
            fetch("/subscribe/calculate/kg", {
                method  : "POST",
                headers : {"Content-Type" : "application/json"},
                body    : JSON.stringify(data)
            })

            .then(resp => resp.text())

            .then( result => {
                if(result > 0 ){
                    location.href = "/subscribe/end?no=" + result;
                } else {
                    alert("결제에 실패하셨습니다.");
                    location.href = "/";
                }
            })

            .catch(err => {
                console.log(err);
            });

          } else {
            // 결제 실패 시 로직,
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
          }
    
         // alert(msg)
      })
    }

})
