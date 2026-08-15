# 🏨 The BIG Hotel — SQL Crime Investigation

## Case #001: Room 708

What if a hotel-management database became a criminal investigation?

I created this MySQL project as a detective-style case study combining hotel operations with CCTV records, access-card logs, DNA evidence, fingerprints, and room bookings.

## 🔎 The Case

During the grand opening of the BIG Hotel, a young man wearing a dark T-shirt is seen standing alone in the crowd.

Minutes later, something unusual happens.

Room **708**, which is listed as vacant, is opened using a hotel access card that had previously been reported lost.

Inside the room, investigators discover:

* DNA on a broken champagne glass
* A partial fingerprint
* A black clothing fiber
* A lost hotel access card
* A handwritten note containing only the number **214**

The investigation is performed through SQL queries.

## 🧬 Evidence

The database reveals several different connections:

* **Daniel Levin** → DNA match: **99.72%**
* **Noah Green** → Fingerprint match: **95.60%**
* **Adam Shalev** → Owner of the lost access card
* **Room 214** → Connected to Adam Shalev
* An unidentified DNA profile → Connected to an older unresolved case
* An unidentified fingerprint → Found in an old police record

## 🕐 Timeline

Using `UNION ALL`, CCTV observations and hotel access logs are combined into one chronological timeline.

Important events include:

* 21:05 — Daniel Levin is seen at the opening ceremony
* 21:12 — Daniel enters the elevator
* 21:15 — An unidentified person appears on the 7th floor
* 21:17 — Lost access card 3004 opens Room 708
* 21:21 — Noah Green approaches Room 708
* 21:23 — Noah's access attempt is denied
* 21:39 — Daniel leaves the hotel

## 💻 SQL Skills Used

This project includes:

* Relational database design
* Primary keys
* Foreign keys
* `CREATE TABLE`
* `INSERT`
* `SELECT`
* `WHERE`
* `BETWEEN`
* `INNER JOIN`
* `LEFT JOIN`
* Multi-table joins
* `UNION ALL`
* `COALESCE`
* `CONCAT`
* Timestamp analysis
* Evidence correlation
* Timeline reconstruction

## 🧠 Analytical Idea

One of the main ideas behind this project is that:

**A database can show connections without automatically proving guilt.**

For example, the fact that Adam Shalev owns the access card used to open Room 708 does not prove that Adam physically used the card.

The same applies to DNA, fingerprints, CCTV observations, and timestamps.

The goal is to use SQL to identify relationships, contradictions, and patterns across multiple data sources.

## 🗄️ Main Tables

The database includes:

* `people`
* `rooms`
* `bookings`
* `access_cards`
* `access_logs`
* `cctv_logs`
* `evidence`
* `dna_profiles`
* `dna_matches`
* `fingerprint_profiles`
* `fingerprint_matches`

## 🛠️ Tools

* MySQL
* MySQL Workbench
* SQL
* GitHub
  
📸 Investigation Screenshots
Evidence Recovered from Room 708

The crime scene contained DNA, a partial fingerprint, a black fiber, a lost access card, and a handwritten note containing the number 214.




Investigation Timeline

CCTV observations and hotel access logs were combined to reconstruct the events of the evening chronologically.




Main People Connected to the Case

Three different individuals are connected to Room 708 through three different forms of evidence.




The Room 214 Clue

The handwritten number 214 leads investigators to a hotel booking connected to Adam Shalev.

## 🚨 Case Status

**OPEN**

Three people are connected to Room 708 through three different forms of evidence.

But the database still leaves one question unanswered:

**Who was actually inside Room 708 at 21:17?**

