const toggleButtons = document.querySelectorAll('.td'); 

toggleButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        const declarationListContent = document.querySelectorAll('.declarationList-content'); 
        
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



