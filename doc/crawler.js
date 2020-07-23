// ==UserScript==
// @name         https://www.skimble.com/​ crawler
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.skimble.com/exercises/*
// @require https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js
// @grant        none
// ==/UserScript==

(function () {
    'use strict';

    // a function that loads jQuery and calls a callback function when jQuery has finished loading
    let dbData = {};
    const dbconnect = window.indexedDB.open('exercises', 1);
    dbconnect.onupgradeneeded = ev => {
        console.log('Upgrade DB');
        const db = ev.target.result;
        const store = db.createObjectStore('Exercise', {keyPath: 'id', autoIncrement: true});
        store.createIndex('Name', 'Name', {unique: true});
        store.createIndex('url', 'url', {unique: false});
        store.createIndex('primary', 'primary', {unique: false});
        store.createIndex('secondary', 'secondary', {unique: false});
        store.createIndex('tags', 'tags', {unique: false});
    }
    dbconnect.onsuccess = ev => {
        console.log('DB-Upgrade erfolgreich');
        const db = ev.target.result;
        const transaction = db.transaction('Exercise', 'readwrite');
        const store = transaction.objectStore('Exercise');

        const query = store.openCursor();
        query.onerror = ev => {
            console.error('Anfrage fehlgeschlagen!', ev.target.error.message);
        };

        // Verarbeitung der Einzel-Query
        query.onsuccess = ev => {
            if (query.result) {
                console.log('Datensatz 1', query.result.Name, query.result.url);
            } else {
                console.warn('Kein Eintrag vorhanden!');
            }
        };

        query.onsuccess = ev => {
            const cursor = ev.target.result;
            if (cursor) {
                console.log(cursor.key, cursor.value.Name, cursor.value.url);
                cursor.continue();
            } else {
                console.log('Keine Einträge mehr vorhanden!');
            }
        };

        console.log('DB daten ausgegeben');
        let name = "#main-content-container > div.carousel.main-carousel.content-header-main-carousel > div > div > div > div > div > div.span8.fill-height > h1";
        let primary_selector = "#main-content-container > div.carousel.main-carousel.content-header-main-carousel > div > div > div > div > div > div.span8.fill-height > div.content-details-metadata > p:nth-child(1) > span.content-detail-list-items";
        let secondary_selector = "#main-content-container > div.carousel.main-carousel.content-header-main-carousel > div > div > div > div > div > div.span8.fill-height > div.content-details-metadata > p:nth-child(2)";
        let tags = "#main-content-container > div.carousel.main-carousel.content-header-main-carousel > div > div > div > div > div > div.span8.fill-height > div.content-details-metadata > p:nth-child(3) > span.content-detail-list-items";
        let tags2 = "#main-content-container > div.carousel.main-carousel.content-header-main-carousel > div > div > div > div > div > div.span8.fill-height > div.content-details-metadata > p:nth-child(4) > span.content-detail-list-items";

        let exercise_name = document.querySelector(name) ? document.querySelector(name).innerText.split(": ")[1] : "";
        let primary_muscles = document.querySelector(primary_selector) ? document.querySelector(primary_selector).innerText.split(", ").toString() : "";
        let secondary_muscles = document.querySelector(secondary_selector) ? document.querySelector(secondary_selector).innerText.split(", ").toString() : "";
        let tag_namess = document.querySelector(tags) ? document.querySelector(tags).innerText.split(", ").toString() : "";
        let tag_namess2 = document.querySelector(tags2) ? document.querySelector(tags2).innerText.split(", ").toString() : "";
        let all_tags = tag_namess+","+tag_namess2;
        let url = document.location.href;

        /*

                const data = [
                    {Name: 'Raptor123', eMail: 'raptor@example.com'},
                ];


                data.forEach(el => store.add({Name:exercise_name,primary:primary_muscles,secondary:secondary_muscles,tags:tag_namess}));
        */
        store.add({
            Name: exercise_name,
            primary: primary_muscles,
            secondary: secondary_muscles,
            tags: all_tags,
            url: url
        });
        // let exercise_links = document.querySelectorAll(".grids-frame li p a");

        transaction.onerror = ev => {
            console.error('Ein Fehler ist aufgetreten!', ev.target.error.message);
        };

        transaction.oncomplete = ev => {
            console.log('Daten wurden erfolgreich hinzugefügt!');
            const store = db.transaction('Exercise', 'readonly').objectStore('Exercise');
            //const query = store.get(1); // Einzel-Query
            const query = store.openCursor();
            query.onerror = ev => {
                console.error('Anfrage fehlgeschlagen!', ev.target.error.message);
            };

            // Verarbeitung der Einzel-Query
            query.onsuccess = ev => {
                if (query.result) {
                    console.log('Datensatz 1', query.result.Name, query.result.url);
                } else {
                    console.warn('Kein Eintrag vorhanden!');
                }
            };

            query.onsuccess = ev => {
                const cursor = ev.target.result;
                if (cursor) {
                    dbData[cursor.key] = {
                        name:cursor.value.Name,
                        primary:cursor.value.primary,
                        secondary:cursor.value.secondary,
                        tags: cursor.value.tags,
                        url: cursor.value.url
                    };
                    cursor.continue();
                } else {
                    debugger;
                    console.log(dbData.toString());
                }
            };
        };
    }



    // Your code here...
})();
/*
function crawling(exercise_links, i) {
            if (exercise_links === null) {
               exercise_links = document.querySelectorAll(".row-fluid ul.thumbnails li a");
            }
            if (i+1 <= exercise_links.length) {
                window.open(exercise_links[i].href, "exercises");

                setTimeout(function () {
                    crawling(exercise_links, i+1)
                }, 1250);

            }


        }

        crawling(null,0);
*/

