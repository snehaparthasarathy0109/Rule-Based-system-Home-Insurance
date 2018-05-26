(deftemplate reason
    
    (slot answer))

(deftemplate flood
    
    (slot coverage))

(deftemplate budget
    
    (slot cash))

(defrule print-banner
    =>
    (printout t "Type your name and press Enter> ")
    (bind ?name (read))
    (printout t crlf "**********************************" crlf)
    (printout t " Hello, " ?name "." crlf)
    (printout t " Welcome to the Home Insurance Policy Recommender" crlf)
    (printout t " Please answer the questions and" crlf)
    (printout t " I will tell you which housing insurance policy" crlf)
    (printout t " is the most suitable for your beautiful home!" crlf)
    (printout t "**********************************" crlf crlf))

(defrule starter
    
    =>
    
    (printout t "What property do you want to insure?" crlf "1.Enter House if you own a private home" crlf "2.Enter Condo if you own a condominium" crlf "3.Enter Rented if you seek insurance for your rented house" crlf "4.Enter Mobile if you own a mobile or a manufactured home" crlf "5.Enter Historic if you own a historic home or a registered landmark" crlf)
    
    (bind ?answer (read))
    
    (if (= ?answer "House")then
        
        (assert (reason(answer House)))
        
        else
        
        (if (= ?answer "Condo")then
            
            (assert (reason(answer Condo)))
            
            else
            
            (if (= ?answer "Rented")then
                
                (assert (reason(answer Rented)))
                
                else
                (if (= ?answer "Mobile")then
                    
                    (assert (reason(answer Mobile)))
                    
                    
                    else
                    
                    (if (= ?answer "Historic")then
                        
                        (assert (reason(answer Historic)))))))))




(defrule HO-4
    
    (reason(answer Rented))
    
    =>
    
    (printout t "Recommendation :"crlf"Choose HO-4"crlf "It covers only belongings and personal liability and not the building structure" crlf "Typically,the building structure's insurance is bought by the house owner"crlf))

(defrule HO-7
    
    (reason(answer Mobile))
    
    =>
    
    (printout t  "Recommendation :"crlf"Choose HO-7"crlf"The mobile home form,HO-7 is essentially the same as an HO-3, but is designed specifically for" crlf "mobile or manufactured home,which don't fall under regular homeowners insurance "))
(defrule HO-6
    
    (reason(answer Condo))
    
    =>
    
    (printout t  "Recommendation :"crlf"Choose HO-6"crlf"This type of policy is designed specifically for condo owners and financially protects belongings" crlf "and personal liability. An HO-6 policy, also known as condo insurance, also typically extends to"crlf
        "the walls, floors, and ceiling of the unit too."crlf"The same incidents covered under a typical homeowners insurance policy generally apply to"crlf"HO-6 coverage too. The rest of the condo's structure is usually covered by a policy purchased"crlf"by the homeowner's association."))

(defrule HO-8
    
    (reason(answer Historic))
    
    =>
    
    (printout t "Recommendation :"crlf"Choose HO-8"crlf"HO-8 policy is designed to address specific concerns with coverage for older homes."crlf
        "The coverage details of a HO-8 are basically the same as a HO-3, but with special adaptations to "crlf"better suit older homes, which may have different coverage needs than newer houses. Historic "crlf "homes and registered landmarks usually carry this type of policy."crlf))


(defrule PrivateHome
    
    (reason(answer House))
    
    =>
    
    (printout t "Do you live in a coastal area ?"crlf"Enter yes if you live in a coastal area"crlf"Enter no if you do not live in a coastal area"crlf)
    
    (bind ?coverage (read))
    
    (if (= ?coverage "yes")then
        
        (assert (flood(coverage yes)))
        
        else
        
        (if (= ?coverage "no")then
            
            (assert(flood(coverage no)))))
    )



(defrule HO
    (reason(answer House))
    
    (flood(coverage yes))
    
    
    =>
    
    (printout t "Recommendation :"crlf"Choose HO" crlf "HOB form typically provides more coverage against"crlf
        "water damage for coastal areas of the U.S."crlf"A HOB policy may also cover things like garden tractors, boat and boat trailers, lawn mowers,"crlf
        "and other similar accessories while they're on your property."crlf))

(defrule HO-1
    
    
    (budget(cash Below927))
    
    
    
    =>
    
    (printout t "Recommendation"crlf"Choose HO-1" crlf"It will usually financially safeguard against 10 named perils:"crlf
        "1.Fire or smoke"crlf"2.Explosions"crlf"3.Lightning"crlf"4.Hail and windstorms"crlf"5.Theft"crlf"6.Vandalism"
        "7.Damage from vehicles"crlf"8.Damage from aircraft"crlf"9.Riots and civil commotion"
        crlf"10.Volcanic eruption"crlf"Floods and earthquakes aren't typically covered"))

(defrule HO-2
    
    
    (budget(cash Below1027))
    
    
    
    =>
    
    (printout t "Recommendation :"crlf"Choose HO-2" crlf"It covers all the perils in an HO-1 policy, plus:"crlf
        "1.Falling objects"crlf"2.Weight of ice, snow, or sleet"crlf"3.Sudden and accidental tearing apart, cracking, burning, or bulging of pipes and other"
        crlf"household systems"crlf"4.Accidental discharge or overflow of water or steam"crlf"Sudden and accidental damage from artificially generated electrical current"crlf
        "The HO-2 typically covers not only your home's structure, but your belongings"crlf"and sometimes even your personal liability as well."crlf))

(defrule HO-3
    
    
    (budget(cash Below2027))
    
    
    
    =>
    
    (printout t "Recoomendation :"crlf"Choose HO-3" crlf"HO-3 doesn't limit coverage only to named perils,it often can provide more financial protection than an HO-2."crlf
        "Your typical HO-3 form can financially protect you against any and all perils unless your policy"crlf"specifically mentions them in the exclusions — and if it doesn't,"crlf"you're covered."))

(defrule HO-5
    
    
    (budget(cash Below3027))
    
    
    
    =>
    
    (printout t "Recommendation:"crlf"Choose HO-5" crlf"It often covers more perils than other types of policies."crlf"Just like a HO-3 form,a HO-5 is an open-peril policy form"crlf"that can financially safeguard you against all perils unless"crlf"your policy specifically excludes them in writing."crlf))



(defrule IBudget
    (reason(answer House))
    (flood(coverage no))
    
    
    
    
    
    =>
    
    (printout t "What is your annual budget ?" crlf "1.Enter Below927 if your Budget is below 927" crlf "2.Enter Below1027 if your budget is below 1027" crlf "3.Enter Below2027 if your budget is below 2027" crlf "4.Enter  Below3027 if your budget is below 3027" crlf)
    
    (bind ?cash (read))
    
    (if (= ?cash "Below927")then
        
        (assert (budget(cash Below927)))
        
        else
        
        (if (= ?cash "Below1027")then
            
            (assert (budget(cash Below1027)))
            
            else
            
            (if (= ?cash "Below2027")then
                
                (assert (budget(cash Below2027)))
                
                else
                
                (if (= ?cash "Below3027")then
                    
                    (assert (budget(cash Below3027)))))))
    )



(reset)
(run)
