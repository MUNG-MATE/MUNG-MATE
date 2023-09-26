let a = [];

if(lgMemberNo != null) {
    fetch("/myPage/selectRsList?memberNo=" + lgMemberNo)
    .then(resp => resp.json())
    .then(rsList => {
        for(let rs of rsList) {
            a[a.length] = rs;
        }
    })
    .catch(err => {
        console.log(err);
    })
}

