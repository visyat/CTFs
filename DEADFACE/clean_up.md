---
Name: Vishal Yathish
Date: 22 October 2023
--- 

# DEADFACE CTF 2023 Write-Up

<img align="left" img width="350" alt="clean up on aisle 5 (#10) **" src="https://github.com/visyat/ctf_writeups/assets/135551666/7854d76c-06bf-479c-88ca-32a8a1f1c461">

The question I found most interesting was the 10th SQL challenge – there were 11 in total. All these challenges used a single database dump (given in the first challenge). The premise of all of these was that a pharmacy/pharmaceutical company had been hacked; hackers had stolen all sorts of information (e.g., patient records, billing information, credit card information, all drugs listed, suppliers/costs of drugs, inventories, specific locations of different drugs, staff records, etc.), but we somehow got a hold of the hacked data and are now trying to extrapolate different things from that. 

This challenge, “Clean Up on Aisle 5” was the trickiest, due to how the question is phrased. It says that an external security firm wants to get information about which facility, aisle, and bin contains the most STAR – STAR being a nickname for the drug Starypax which we had dealt with in prior questions. My first approach was to simply sort the list of facilities (from the inventory table) by which one had the highest stored quantity of STAR – I filtered by the drug’s ID (26). 

From this, I assumed that the target facility (which contained the highest quantity of STAR) would be facility #739 – in Fort Worth, TX. With the ID, I found the storage location for the desired drug in the facility (shown above), with ‘A’ indicating aisle and ‘B’ indicating bin number (according to the system design specifications. 

<img width="1000" alt="Vishal Yathish - DEADFACE CTF 2023 Write-Up" src="https://github.com/visyat/ctf_writeups/assets/135551666/5f498291-de92-43bb-af2e-ca23382f4fe1">

Thus, I assumed that the answer to the challenge was flag{739-18-9}. It was not. And this was very frustrating.

What I didn’t realize was the hidden clue in the question. The second part of the instructions says to provide the location of the facility with the most STAR in the city DEADFACE is targeting. I assumed that the city DEADFACE was targeting was the one with the facility with the most STAR, but that was not necessarily accurate. I used the reference in the first part of the question and went back to the Ghost Face forum, and ⌘-F’d for “Aurora.” Rather annoyingly, the very first thing that came up was a (fake) conversation from the (fake) hackers about how they were targeting Phoenix, AZ. Why Phoenix? I have no idea. However, with this information, I filtered my search for facilities in Phoenix and found the one with the highest quantity of STAR.

<img width="1000" alt="Picture2" src="https://github.com/visyat/ctf_writeups/assets/135551666/b2ca553f-4b91-4bf3-ba9f-451ff1686361">

The final answer was the first one: **flag{412-11-44}**. 
