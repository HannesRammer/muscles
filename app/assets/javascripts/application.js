// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//


//= require rails-ujs
//= require turbolinks
//= require_tree .
////= require jquery


function toggleClass(elem, className1, className2) {
    elem.className = (elem.className === className1) ? className2 : className1;
}
function setClass(elem, className1) {
    elem.className = className1;
}



function toggleExercise() {
    let exercise= document.querySelector("#exercise");
    if (exercise.innerHTML !== "") {

        let open_exercise= document.querySelector("#open_exercise");
        if (open_exercise.className === "open_exercise") {
            open_exercise.className = "close_exercise";
            open_exercise.innerHTML = "V<br/>E<br/>R<br/>B<br/>E<br/>R<br/>G<br/>E<br/>N";

            document.querySelector("#exercise").className = "show_exercise";
            window.scrollBy(2000, 0);
            setTimeout(toggleImage, 1000);
        } else if (open_exercise.className === "close_exercise") {
            window.scrollBy(-2000, 0);
            open_exercise.innerHTML = "A<br/>N<br/>S<br/>E<br/>H<br/>E<br/>N";
            exercise.className = "hidden_exercise";
            open_exercise.className = "open_exercise";

        }
    }
}

function toggleTraining() {
    if (document.querySelector("#training").innerHTML !== "") {


        if (document.querySelector("#open_training").className === "open_training") {
            document.querySelector("#open_training").className = "close_training";
            document.querySelector("#open_training").innerHTML = "V<br/>E<br/>R<br/>B<br/>E<br/>R<br/>G<br/>E<br/>N";

            document.querySelector("#training").className = "show_training";
            window.scrollBy(2000, 0);
            setTimeout(toggleImage, 1000);
        } else if (document.querySelector("#open_training").className === "close_training") {
            window.scrollBy(-2000, 0);
            document.querySelector("#open_training").innerHTML = "A<br/>N<br/>S<br/>E<br/>H<br/>E<br/>N";
            document.querySelector("#training").className = "hidden_training";
            document.querySelector("#open_training").className = "open_training";

        }
    }
}

function toggleImage() {
    if (document.querySelector("#open_exercise").className === "close_exercise") {
        var imagePath = document.querySelector("#exercise_picture").src;
        var splitPath = imagePath.split("/exercises/");
        var prePath = splitPath[0];
        var fileName = splitPath[1];

        var splitFileName= fileName.split("-")[0];
        splitFileName = splitFileName.split("1.jpg")[0];
        var cleanFileName = splitFileName.split(".jpg")[0];

        if (fileName.include("1.jpg")) {
            document.querySelector("#exercise_picture").src = prePath + "/exercises/" + cleanFileName + ".jpg"
        } else {
            document.querySelector("#exercise_picture").src = prePath + "/exercises/" + cleanFileName + "1.jpg";

        }
        setTimeout(toggleImage, 1000);
    }
}

function change_style() {
    drop_down = document.style_form.style_options;
    color = drop_down.options[drop_down.selectedIndex].value;
    setClass(document.querySelector("body"), "theme_" + color);

    let exp = new Date();
    let numdays = 7;
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * numdays));
    document.cookie = "style=" + color + "; path=; expires=" + exp.toGMTString();

}

function back_style() {
    new_style("-");
}

function next_style() {
    new_style("+");
}

function new_style(x) {

    let drop_down = document.style_form.style_options;
    let new_index, color;
    if (x === "+") {
        new_index = drop_down.selectedIndex + 1;
    } else if (x === "-") {
        new_index = drop_down.selectedIndex - 1;
    }
    if (new_index >= 0 && drop_down.options[new_index]) {

    } else {
        if (x === "+") {
            new_index = 0;
        } else if (x === "-") {
            new_index = drop_down.length - 1;
        }
    }
    color = drop_down.options[new_index].value;
    drop_down.selectedIndex = new_index;
    setClass(document.querySelector("body"), "theme_" + color);

    var exp = new Date();
    var numdays = 7;
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * numdays));
    document.cookie = "style=" + color + "; path=; expires=" + exp.toGMTString();

}

function toggle_tab(id) {
    let factor = id.split("_")[0];
    debugger;
    let primary = document.querySelector("#"+factor + "_primary");
    let secondary = document.querySelector("#"+factor + "_secondary");

    let primaryTab = document.querySelector("#"+factor + "_primary_tab");
    let secondaryTab = document.querySelector("#"+factor + "_secondary_tab");
    if (id === (factor + "_primary")) {
        primary.classList.toggle( "hide" );
        primaryTab.classList.toggle( "activeTab" );

    }
    else if (id === (factor + "_secondary")) {
        secondary.classList.toggle( "hide" );
        secondaryTab.classList.toggle( "activeTab" );
    }
    /* else if (id == (factor + "_antagonist")) {
     document.querySelector(factor + "_antagonist").style.display = "block";
     setClass(document.querySelector(factor + "_antagonist_tab"), document.querySelector(factor + "_antagonist_tab").className.gsub("underline", ""));

     }   */
}


function set_level(percent, id, way) {             //called
    if (way === "down") {
        document.querySelector("#" + id + "_e").style.height = (100 - percent) + "px";
        document.querySelector("#" + id + "_f").style.height = percent + "px";
    }
    if (way === "left") {
        document.querySelector("#" + id + "_f").style.width = (100 - percent) + "px";

    }
}

function toggle_running(elem) {
    if (elem.value === "false") {
        elem.value = "true";
        document.querySelector("#pause_training").innerHTML = "<b>pause training</b>";
    } else {
        elem.value = "false";
        document.querySelector("#pause_training").innerHTML = "<b>resume training</b>";
    }


}

function startExercise(i) {
    document.querySelector("#running").value = "true";
    document.querySelector("#allow_pause").value = "true";
    document.querySelector("#start_training").innerHTML = "";
    /*document.querySelector("pause_training").innerHTML = "<b>pause training</b>";*/
    reps = document.querySelector("#reps").value;
    single_rep = document.querySelector("#single_rep").value * 1000;
    perc = 100;
    set_level(perc, "reps_div", "left");
    set_level(perc, "single_rep_div", "left");
    set_level(0, "pause_div", "left");
    do_rep(single_rep, single_rep, reps, reps, i);
}
function do_rep(single_rep, counter, reps, new_reps, i) {

    if (counter > 0) {

        if (document.querySelector("#hold_div_f").innerHTML === 0) {
            drown_to_null(single_rep, counter, "single_rep_div");
            //set_timeline(single_rep, counter) ;
            document.querySelector("#single_rep_div_f").innerHTML = (counter / 1000);

            if (counter > (single_rep / 2)) {
                extention = ".jpg";
                do_it = "push it!!";
            }
            else if (counter === (single_rep / 2)) {
                hold = document.querySelector("#hold").value * 1000;
                extention = "1.jpg";
                document.querySelector("#hold_div_f").innerHTML = hold;
                do_it = "Halten";
            }
            else if (counter < (single_rep / 2)) {
                extention = "1.jpg";
                do_it = "release";
            }
            document.querySelector("#training_pic").src = "/images/exercises/" + trainingsArray[i] + extention;

            document.querySelector("#training_text").innerHTML = do_it;

            counter = counter - 100;
            setTimeout("do_rep(" + single_rep + "," + counter + "," + reps + "," + new_reps + "," + i + ")", 100);
        }
        else {
            hold_on(hold, hold, single_rep, counter, reps, new_reps, i);
        }
    } else {
        fill("single_rep_div", 0);
        document.querySelector("#single_rep_div_f").innerHTML = 0;
        new_reps = new_reps - 1;
        if (new_reps > 0) {
            drown_to_null(reps, new_reps, "reps_div");
            document.querySelector("#reps_div_f").innerHTML = new_reps;
            full("single_rep_div");
            do_rep(single_rep, single_rep, reps, new_reps, i);
        } else {
            fill("reps_div", 0);
            document.querySelector("#reps_div_f").innerHTML = 0;

            i = i + 1;
            if (i < trainingsArray.length) {
                pause = document.querySelector("#pause").value * 1000;
                pause_c(pause, pause, i)
            } else {
                document.querySelector("#running").value = "false";
                document.querySelector("#allow_pause").value = "false";
                document.querySelector("#start_training").innerHTML = "<b>start</b>";
                /*document.querySelector("#pause_training").innerHTML = "";*/
            }
        }


    }


}

function pause_for(milliseconds) {
    var dt = new Date();
    while (new Date() - dt <= milliseconds) { /* Do nothing */
    }
}


function pause_c(x, y, i) {
    document.querySelector("#training_text").innerHTML = "noch " + (x / 1000) + " s pause";
    if (x > 0) {
        x = x - 100;
        drown_to_null(y, x, "pause_div");
        setTimeout("pause_c(" + x + "," + y + "," + i + ")", 100);
    } else {
        startExercise(i);
    }
}
function hold_on(max, counter, single_rep, counter_1, reps, new_reps, i) {
    document.querySelector("#training_text").innerHTML = "noch " + (counter / 1000) + " s halten";
    if (counter > 0) {
        counter = counter - 100;
        drown_to_null(max, counter, "hold_div");
        document.querySelector("#hold_div_f").innerHTML = counter;
        setTimeout("hold_on(" + max + "," + counter + "," + single_rep + "," + counter_1 + "," + reps + "," + new_reps + "," + i + ")", 100);
    } else {
        fill("hold_div", 0);
        do_rep(single_rep, counter_1, reps, new_reps, i);
    }
}
//set_level id to 100%
function full(id) {               //inject
    set_level(100, id, "left");
}

function fill(id, perc) {               //inject
    set_level(perc, id, "left");
}

//calles set_level function with max val and current val
function drown_to_null(counter_max, counter, id) {             //called
    var percent = ((100 / counter_max ) * counter);
    if (percent > 0) {
        set_level(percent, id, "left")
    }
}

function set_timeline(counter_max, counter) {             //called
    var usertime_percent = ((100 / counter_max ) * counter);
    duration = document.querySelector("#htmlPlayer").duration;
    x = (duration / 100) * usertime_percent;
    document.querySelector("#htmlPlayer").currentTime = duration - x;
    document.querySelector("#vid").value = (duration - x)/60;

}

function set_training(r, s, h, p) {
    document.querySelector("#reps").value = r;
    document.querySelector("#single_rep").value = s;
    document.querySelector("#hold").value = h;
    document.querySelector("#pause").value = p;

}