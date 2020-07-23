// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.spotebi.com/exercise-guide/*
// @require https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js
// @grant        none
// ==/UserScript==

(function () {
    'use strict';

    // a function that loads jQuery and calls a callback function when jQuery has finished loading

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


        let name = "body > div.site-container > div.site-inner > div > main > article > div > h2:nth-child(5)";
        let primary_selector = "body > div.site-container > div.site-inner > div > main > article > div > p:nth-child(4) > strong:nth-child(1)";
        let secondary_selector = "body > div.site-container > div.site-inner > div > main > article > div > p:nth-child(4) > strong:nth-child(3)";
        let tags = "body > div.site-container > div.site-inner > div > main > article > div > p:nth-child(4) > strong:nth-child(5)";

        let exercise_name = document.querySelector(name)?.innerHTML || "";
        let primary_muscles = document.querySelector(primary_selector)?.innerHTML || "";
        let secondary_muscles = document.querySelector(secondary_selector)?.innerHTML || "";
        let tag_namess = document.querySelector(tags)?.innerHTML || "";
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
            tags: tag_namess,
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
            const query = store.openCursor()
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
        };
    }

        function crawling(exercise_links, i) {
            if (exercise_links === null) {
                exercise_links = document.querySelectorAll(".grids-frame li p a");
            }
            if (i+1 < exercise_links.length) {
                window.open(exercise_links[i].href, "exercise");

                setTimeout(function () {
                    crawling(exercise_links, i+1)
                }, 2000);

            }


        }

        crawling(null,0);
    // Your code here...
})();





