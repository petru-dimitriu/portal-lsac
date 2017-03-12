# Specificații

## Tehnologii folosite
* JSP, HTML5, CSS3, Javascript, JQuery etc

## Generale
* Interfața este în limba română.
* Codul este în limba engleză.
* Portalul are o variantă simplă pentru public și una amplă pentru membri.

## Secțiunile
* Portalul are trei secțiuni/module de conținut: articole/știri, vot online, albume, depozit de fișiere.

## Utilizatorii înscriși
* Utilizatorii pot fi de 4 feluri: admin, normal, membru activ, membru emerit (cei care au încheiat facultatea fiind membri ai Ligii), exclus (ban-at).
* Utilizatorii se loghează cu mail și parolă.
* Înscrierea de noi utilizatori și promovarea lor se poate face doar de către admin.
* Adminii trebuie să aibă o modalitate simplă de a înscrie mulți membri odată, prin introducerea numelui a adresei de mail. Se va genera o parolă temporară pe care utilizatorul o va schimba la prima logare.
* Adminii pot distruge conturile celorlalți utilizatori.

## Paginile utilizatorului
* Fiecare utilizator are pagină de profil (cu nume, data când a intrat în Ligă, fotografie, descriere).
* Fiecare utilizator are un blog personal, unde poate scrie articole de opinie, informare etc.
* Fiecare utilizator își poate edita sau șterge propriile articole.
* Fiecare utilizator își poate gestiona propriile fișiere încărcate.
* Fiecare articol are titlu, corp de text, data publicării, data ultimei editări, număr de aprecieri care poate fi alterat de utilizatori prin acționarea unor butoane ^ / v.
* Fiecare articol poate avea o fotografie atașată și, eventual, trimiteri la albume.
* Fiecare articol are trei grade de expunere: privat (doar cel care l-a scris), intern (doar membrii înscriși și logați), public (oricine).
* Adminii pot promova articolele celorlalți membri, și pe ale lor, pe prima pagină publică sau pe prima pagină internă.
* Adminii pot modera (edita sau șterge) articolele celorlalți utilizatori.
* Adminii pot alege să blocheze editarea/ștergea unui articol al altui utilizator, afișarea datei postării, a numărului de aprecieri și a autorului articolului (pentru articole publice de interes general - ex Contact, Istoric etc)

## Vot online
* Adminii pot posta întrebări cu variante pentru a realiza sondaje.
* Sondajele sunt strict private.
* Sondajele pot fi active sau arhivate.
* Rezultatul sondajelor se calculează ca fiind numărul de voturi pro minus numărul de voturi contra.
* Votul la sondaje poate fi: „public” (se poate vedea votul fiecărui utilizator) sau anonim.
* Odată trimis, votul nu poate fi retras.
* Sondajele sunt constrânse de o dată limită, după care sunt arhivate.
* Adminii pot opri sau șterge sondajele.

## Albume
* Fiecare utilizator poate încărca fotografii pe site, pentru a le include în articole, ca parte din funcționalitatea depozitului de fișiere.
* Fiecare utilizator își poate șterge propriile fotografii.
* Articolele pot fi grupate în albume de către admini.
* Albumele pot fi interne sau publice.

## Depozit de fișiere
* Fiecare utilizator poate încărca pe site fișiere de tip jpg, png, gif, doc, odt, xls, pdf.
* Adminii pot alege, dintre acestea, fotografii pentru a forma albume.
* Adminii pot vedea și șterge fișierele altor utilizatori, la nevoie.

## Pagini de administrare
* Înregistrare utilizatori
* Gestionare utilizatori (schimbă tipul de utilizator, schimbă datele)
* Gestionare articole (moderează articole, șterge articole, promovează articole pe prima pagină publică sau pe prima pagină internă)
* Gestionare fișiere (vede și șterge fișiere vechi)
* Administrare sondaje (creare, oprire, editare)
* Administrare albume (creează albume din fotografiile proprii sau ale altor utilizatori)

## Nice to have
* Comentarii la articole / sondaje
