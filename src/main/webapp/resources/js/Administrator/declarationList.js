const toggleButtons = document.querySelectorAll('.td'); 

toggleButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        const declarationListContent = document.querySelectorAll('.declarationList-content'); 

        // 현재 클릭한 버튼 다음의 답변 행을 토글하여 보이거나 숨깁니다.
        declarationListContent.forEach((row, rowIndex) => {
            if (rowIndex === index) {
                if (row.style.display === 'none' || row.style.display === '') {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            } else {
                row.style.display = 'none'; 
            }
        });
    });
});



