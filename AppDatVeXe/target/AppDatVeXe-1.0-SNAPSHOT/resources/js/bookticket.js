// let seatSelected = (id) => {
//     $("#seatPosition").val(id)
//     $("#booking").css("display", "block")
// }
function seatSelected(id) {
    let seatPos1 = document.getElementById("seatPositionHidden");
    let seatPos2 = document.getElementById("seatPositionView");
    let bookingBlock = document.getElementById("booking");

    if (seatPos1) {
        seatPos1.value = seatPos2.value = id;
    }
    bookingBlock.style.display = "block";
    bookingBlock.scrollIntoView();
}