var flagicon = false;
function handleClick(){
    if(!flagicon)
    {
        document.getElementsByClassName('fas fa-bars')[0].className='fas fa-times';
        document.getElementsByClassName('navbar-nav')[0].className='navbar-nav show';
        flagicon = true;
    }
    else {
        closeNav();
    }
}
function closeNav(){
    document.getElementsByClassName('fas fa-times')[0].className='fas fa-bars';
    document.getElementsByClassName('navbar-nav show')[0].className='navbar-nav';
    flagicon = false;
}