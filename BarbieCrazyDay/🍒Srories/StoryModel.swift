//
//  StoryModel.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct StoryModel {
    var reward: Int
    var title: String
    var background: ImageResource
    var gift: ImageResource
    var text: [String]
    var options: [String: String]
    var trueOption = "Option 1"
}

extension Story {
    static var firstStory = StoryModel(reward: 1000, title: Story.firstTitle, background: .Stories.First.background, gift: .Stories.First.gift, text: Story.firstText, options: Story.firstOptions)
    static var secondStory = StoryModel(reward: 2000, title: Story.secondTitle, background: .Stories.Second.background, gift: .Stories.Second.gift, text: Story.secondText, options: Story.secondOptions)
    static var thirdStory = StoryModel(reward: 3000, title: Story.thirdTitle, background: .Stories.Third.background, gift: .Stories.Third.gift, text: Story.thirdText, options: Story.thirdOptions)
    static var fourthStory = StoryModel(reward: 4000, title: Story.fourthTitle, background: .Stories.Fourth.background, gift: .Stories.Fourth.gift, text: Story.fourthText, options: Story.fourthOptions)
    static var fifthStory = StoryModel(reward: 5000, title: Story.fifthTitle, background: .Stories.Fifth.background, gift: .Stories.Fifth.gift, text: Story.fifthText, options: Story.fifthOptions)
    static var sixthStory = StoryModel(reward: 6000, title: Story.sixthTitle, background: .Stories.Sixth.background, gift: .Stories.Sixth.gift, text: Story.sixthText, options: Story.sixthOptions)
    static var seventhStory = StoryModel(reward: 7000, title: Story.seventhTitle, background: .Stories.Seventh.background, gift: .Stories.Seventh.gift, text: Story.seventhText, options: Story.seventhOptions)
    static var eighthStory = StoryModel(reward: 8000, title: Story.eighthTitle, background: .Stories.Eighth.background, gift: .Stories.Eighth.gift, text: Story.eighthText, options: Story.eighthOptions)
    static var ninthStory = StoryModel(reward: 9000, title: Story.ninthTitle, background: .Stories.Ninth.background, gift: .Stories.Ninth.gift, text: Story.ninthText, options: Story.ninthOptions)
    static var tenthStory = StoryModel(reward: 10_000, title: Story.tenthTitle, background: .Stories.Tenth.background, gift: .Stories.Tenth.gift, text: Story.tenthText, options: Story.tenthOptions)
    
    static var firstTitle = "The Frozen Echo"
    static var secondTitle = "The Scorched Map"
    static var thirdTitle = "The Whispering Winds"
    static var fourthTitle = "The Gathering Clouds"
    static var fifthTitle = "The Eclipse"
    static var sixthTitle = "The Deluge"
    static var seventhTitle = "The Siege of Fog"
    static var eighthTitle = "The Sacrificial Storm"
    static var ninthTitle = "The Frostfire Depths"
    static var tenthTitle = "The Celestial Tempest"
    
    static var firstOptions = ["""
    Option 1: Hide the artifact
    You look around, ensuring no one is watching, and quickly bury the artifact back in the snow. This power, this mystery—it's too dangerous to share. You decide to keep the secret, hoping you made the right choice.
    """ : """
    As you walk away, a sense of dread lingers. Without understanding the artifact, you risk its power falling into the wrong hands. The eerie silence of the forest feels more oppressive, and you can't shake the feeling that you've missed a crucial opportunity.
    """,
    """
    Option 2: Share the Discovery
    Gripping the artifact tightly, you rush back to the village. The elders must know about this—they might have the knowledge to decipher its meaning and the connection to your name. This discovery could change everything.
    """ : """
    The village elders gather around, their eyes widening at the sight of the artifact. They recognize it immediately, recounting ancient legends of a powerful relic connected to your lineage. Together, you unlock its secrets, revealing a path to great knowledge and strength. Your decision to share has brought your community closer and unveiled a hidden chapter of your heritage.
    """,
    """
    Option 3: Keep the Artifact and Study It
    You decide to keep the artifact with you, determined to unravel its secrets on your own. Perhaps, in understanding it, you'll uncover more about your own past and the ancient connection hinted at by the whisper.
    """ : """
    Days turn into weeks as you study the artifact, but progress is slow. The mysteries it holds are vast and complex, beyond your solitary efforts. The village grows suspicious of your secrecy, and the burden of the artifact's power becomes heavier. Alone, you struggle to comprehend its full potential, realizing too late that collaboration might have been wiser.
    """]
    static var secondOptions = ["""
    Option 1: Follow the Mysterious Figure
    You take a deep breath and step towards the figure. There's something strangely familiar and comforting about their presence. Maybe they hold the key to understanding the path and the artifact's purpose.
    """ : """
    As you follow the figure, they lead you through a series of hidden passages and ancient traps, all the while sharing knowledge about the artifact and your connection to it. Their guidance proves invaluable, helping you unlock the true potential of the artifact and uncovering secrets that would have remained hidden if you had ventured alone.
    """, """
    Option 2: Explore Alone
    You decide to rely on your instincts and set out on the path alone. The figure fades away, and you feel a surge of independence and determination. This journey is yours to undertake without any external influence.
    """ : """
    The path is treacherous and filled with challenges that test your resolve and strength. Without guidance, you struggle to navigate the ancient mechanisms and hidden dangers. Though you make some progress, the journey is arduous, and you often wonder if you would have fared better with the mysterious figure’s help.
    """, """
    Option 3: Destroy the Map
    Distrustful of both the map and the figure, you decide to eliminate the potential threat. You take the artifact and use its power to destroy the remaining piece of the map, ensuring no one else can follow the path.
    """ : """
    By destroying the map, you ensure that its secrets are lost forever. While this prevents anyone from misusing the information, it also means you forfeit the chance to uncover the artifact's full potential and the mysteries it holds. The artifact's glow dims, and you are left with unanswered questions and a sense of missed opportunity.
    """]
    static var thirdOptions = ["""
    Option 1: Help the Spirit
    You reach out, touching the crystal prison with the artifact. The spirit's plea tugs at your heart, and you cannot ignore its suffering. With a surge of power, you break the enchantment and set the spirit free.
    """ : """
    The spirit, grateful for the chance to negotiate, agrees to your terms. You release it from its prison, and true to its word, the spirit becomes a loyal ally. Its knowledge and power prove invaluable, guiding you through subsequent trials and revealing hidden paths. The mythical creatures honor your cleverness and bravery, and you feel the satisfaction of having made a wise choice.
    """, """
    Option 2: Continue Your Quest
    You turn away from the spirit, focusing on the grove and the mythical creatures that could offer guidance for your journey. The spirit's pleas fade as you walk away, determined to complete your quest without additional risks.
    """ : """
    The grove is bathed in a blinding light as the spirit is released. The mythical creatures bow their heads in respect as the spirit's form solidifies into a majestic being of light. Grateful for your help, the spirit bestows upon you ancient knowledge and a powerful blessing. However, its release also awakens an old adversary bound to the spirit's fate, setting the stage for future challenges.
    """, """
    Option 3: Bargain with the Spirit
    You decide to strike a deal with the spirit. You agree to release it, but only if it promises to aid you in your quest and ensure no harm comes from its freedom.
    """ : """
    As you delve deeper into the grove, the mythical creatures share their wisdom and aid, impressed by your resolve. Though you gain valuable allies and insights, the lingering memory of the trapped spirit haunts you. You wonder if you missed a crucial opportunity to uncover deeper truths and connections.
    """]
    static var fourthOptions = ["""
    Option 1: Harness the Storm's Power
    You choose to harness the storm's power, believing that with proper control, it could be used for great good. Holding the artifact aloft, you channel its energy, ready to face whatever consequences may come.
    """ : """
    As you invoke the artifact's power, the storm begins to break apart. The skies clear and a sense of peace returns to both realms. The wise beings commend your bravery and foresight. By averting the disaster, you have safeguarded the future of both worlds. The ripple effects of your choice are largely positive, bringing a renewed sense of hope and cooperation between the two realms.
    """, """
    Option 2: Stop the Storm Entirely
    You decide to stop the storm, aiming to protect both worlds from its destructive potential. With the second artifact, you confront the storm head-on, using its power to disperse the clouds and calm the winds.
    """ : """
    The storm's fury is immense, but you manage to channel its power into the artifact. The ground trembles and the sky crackles with energy, but your resolve holds firm. As the storm subsides, you find yourself imbued with newfound strength and abilities. However, the balance of both worlds is altered, and you must now navigate a landscape transformed by your choice. This power brings great responsibility and unforeseen challenges.
    """, """
    Option 3: Seek Another Way
    You hesitate to choose either artifact, feeling that another solution might exist. You set out to find an alternative, hoping to uncover a hidden path that might resolve the crisis without directly harnessing or stopping the storm.
    """ : """
    Your quest for another solution leads you through uncharted territories and encounters with new allies. While you gather valuable knowledge and resources, the storm's approach does not waver. In the end, your indecision allows the storm to grow stronger, forcing a difficult battle to protect both worlds. Though you manage to mitigate some of the damage, the delay costs many lives and leaves both realms scarred.
    """]
    static var fifthOptions = ["""
    Option 1: Join Your Ally
    Feeling the pull of power and the allure of a shared vision, you choose to align yourself with your ally's ambitions. Together, you could wield the artifact's power to enact change on a grand scale, shaping the world according to your combined desires.
    """ : """
    As you escape into the darkness, you feel a sense of relief and determination. Though the road ahead is fraught with challenges, you know that you have made the right choice. With the artifact in hand, you set out to find allies who will stand with you against tyranny and oppression. Together, you will build a coalition of like-minded individuals, united in the cause of justice and freedom.
    """, """
    Option 2: Escape and Find Allies
    Recognizing the danger of your ally's intentions, you choose to flee, determined to find allies who share your beliefs and will stand against the abuse of the artifact's power. With the eclipse as your cover, you slip away into the shadows, vowing to forge a new path.
    """ : """
    As you join forces with your ally, you feel the surge of power coursing through your veins. Together, you become a force to be reckoned with, your influence spreading far and wide. However, as time passes, you begin to question the morality of your actions and the cost of your newfound power. The path you've chosen leads to darkness and uncertainty, and you wonder if the ends truly justify the means.
    """, """
    Option 3: Confront Your Ally
    Refusing to be swayed by your ally's treachery, you choose to confront them head-on, hoping to reason with them or at least stall their plans long enough to find a way to stop them.
    """ : """
    The confrontation is intense, filled with heated words and tense moments. Despite your efforts, your ally remains resolute in their determination to seize power. In the end, you are forced to flee, knowing that direct conflict would only lead to destruction. Alone and on the run, you must now gather your strength and resources to mount a resistance against your former ally's tyranny.
    """]
    static var sixthOptions = ["""
    Option 1: Use the Artifact's Powers
    Feeling the allure of its power and the temptation of what could be achieved, you choose to accept the artifact's offer. With a sense of determination, you grasp the artifact tightly, ready to wield its full might despite the risks.
    """ : """
    As you unleash the artifact's powers, you feel a surge of energy coursing through your veins, the world bending to your will. The rains cease, and the skies clear, a testament to your newfound control. Yet, as time passes, you begin to witness the unintended consequences of your actions—natural disasters, chaos, and upheaval. The price of power weighs heavily on your conscience, and you wonder if it was worth the cost.
    """, """
    Option 2: Destroy the Artifact
    Recognizing the dangers inherent in wielding such power, you choose to destroy the artifact, ensuring that its destructive potential can never be unleashed again. With a heavy heart, you prepare to shatter the artifact and bear the burden of this solemn responsibility.
    """ : """
    As you destroy the artifact, a sense of relief washes over you, knowing that you have prevented a potential catastrophe. The rains may continue, but with the artifact's threat neutralized, there is hope for a brighter future. Though the world may still face challenges, you have taken a crucial step towards ensuring its survival. Your sacrifice will be remembered as an act of courage and selflessness, a testament to the strength of your character.
    """]
    static var seventhOptions = ["""
    Option 1: Lead a Daring Escape Through the Fog
    Embracing the element of surprise offered by the thick fog, you choose to lead a daring escape through the secret passage. With determination in your heart, you rally your allies and prepare to slip away into the mist, hoping to evade the enemy's grasp and live to fight another day.
    """ : """
    As you navigate the labyrinthine passages of the secret route, the fog providing cover for your movements, you feel a surge of adrenaline coursing through your veins. Though the journey is fraught with peril, you and your companions emerge on the other side, free from the clutches of your besiegers. With the enemy left bewildered and disoriented by your escape, you live to fight another day, your resolve strengthened by your narrow victory.
    """, """
    Option 2: Stay and Fight Off the Attackers
    Refusing to cower in the face of adversity, you choose to stand your ground and confront the attackers head-on. With weapons drawn and courage in your heart, you prepare to defend your hideout to the last, determined to repel the siege and emerge victorious.
    """ : """
    As the fog thickens and the enemy draws near, you and your comrades brace yourselves for the inevitable clash. The battle is fierce and unforgiving, each moment filled with the clang of steel and the cries of the wounded. Though you fight valiantly, the odds are stacked against you, and the enemy's numbers seem endless. As the siege rages on, you begin to wonder if staying and fighting was the right choice, or if it has only hastened your downfall.
    """]
    static var eighthOptions = ["""
    Option 1: Seek Revenge
    Driven by grief and righteous fury, you choose to seek vengeance against those responsible for the loss of your beloved ally. With their spirit whispering words of encouragement in your ear, you embark on a quest for justice, determined to mete out punishment to those who dared to threaten your group.
    """ : """
    As you set out on your quest for vengeance, the flames of anger burn bright within you, lending strength to your resolve and steeling your determination. But with each step you take down the path of retribution, you feel the weight of your actions bearing down upon you, the lines between justice and revenge blurring with each passing moment. Will your thirst for vengeance consume you, or will you find a way to honor your ally's memory without sacrificing your own humanity?
    """, """
    Option 2: Forge a Path of Peace
    Choosing to honor the memory of your fallen ally with actions of compassion and forgiveness, you opt to forge a path of peace in the wake of their sacrifice. With their spirit offering words of wisdom and guidance, you strive to find common ground with those who may have once been considered enemies, seeking to build bridges rather than burn them.
    """ : """
    As you extend the hand of friendship to former adversaries, you feel a sense of peace and fulfillment wash over you, knowing that you are honoring your ally's memory in the truest sense. Though the road to peace may be fraught with challenges and obstacles, you are bolstered by the knowledge that your actions are guided by the spirit of selflessness and compassion that your ally embodied. With each act of kindness, you pave the way for a brighter future, one built on the foundation of understanding and unity.
    """]
    static var ninthOptions = ["""
    Option 1: Trust the Old Sage
    Swayed by the sage's reputation and the promise of his wisdom, you choose to accept his offer of alliance. With a wary heart and a steely resolve, you agree to aid him in his bid for freedom, hoping that his guidance will prove invaluable in navigating the treacherous depths of the cavern.
    """ : """
    As you forge ahead into the darkness, the weight of solitude heavy upon your shoulders, you rely on your own strength and resourcefulness to overcome the dangers that lie in wait. Though the journey is fraught with peril and uncertainty, you emerge triumphant, the artifact clutched tightly in your grasp. Though the path was arduous and the dangers great, you know that you have emerged from the depths with your integrity and honor intact, a testament to the strength of your character.
    """, """
    Option 2: Face the Cavern's Perils Alone
    Refusing to place your trust in a being of uncertain intent, you choose to face the cavern's perils alone, relying on your own skills and instincts to navigate the treacherous depths and retrieve the artifact.
    """ : """
    As you join forces with the old sage, you feel a surge of confidence coursing through your veins, his guidance bolstering your own resolve. Together, you face the perils of the cavern as a united front, overcoming obstacles and challenges with ease. But as you delve deeper into the darkness, you begin to question the true motives of your newfound ally, wondering if his intentions are as noble as they seem.
    """]
    static var tenthOptions = ["""
    Option 1: Restore Balance
    With the adversary's defeat imminent, you choose to restore balance to the world, ensuring that the cosmic energies unleashed during the celestial tempest are brought back into harmony. Drawing upon the powers bestowed upon you by the celestial alignment, you channel your energies into a ritual of restoration, weaving together the threads of light and darkness to mend the rifts that have torn the world asunder.
    """ : """
    As you harness the cosmic energies swirling around you, you feel a sense of peace and tranquility wash over you, the tumult of battle giving way to a serene calm. With a whispered incantation, you restore balance to the world, the celestial tempest dissipating like morning mist in the light of dawn. Though the scars of the conflict may linger, the world is once again whole, and a new era of peace and prosperity dawns on the horizon.
    """, """
    Option 2: Reshape the World
    Empowered by the celestial energies at your command, you choose to seize the opportunity presented by your adversary's defeat to reshape the world according to your own desires. With a triumphant roar, you unleash your powers, bending reality to your will and forging a new world in your image.
    """ : """
    As you reshape the world to fit your vision, you feel a surge of exhilaration coursing through your veins, the thrill of absolute power intoxicating in its intensity. With each stroke of your hand, the world transforms before your eyes, reshaping itself according to your whims and desires. But as you revel in your newfound dominion, a nagging doubt gnaws at the edges of your consciousness, whispering of the consequences of your actions and the price of unchecked ambition.
    """]
    
    
    static var firstText = ["""
    The wind howled through the dense forest, whipping snow into a frenzy that obscured your vision. Each step was a struggle as you trudged through knee-deep drifts, the cold biting through your layers of clothing.
    Suddenly, your foot struck something hard beneath the snow. You paused, curiosity momentarily overpowering the cold.
    Brushing away the snow, you revealed an ancient, glowing artifact half-buried in the ground. The light it emitted was a soft, pulsating blue, casting eerie shadows on the surrounding snow. You knelt down, your gloved hand hovering over it, and then, with a deep breath, you touched the artifact.
    """,
    """
    Instantly, the storm ceased. The howling wind fell silent, and the snowflakes froze mid-air, shimmering like a million tiny diamonds before slowly drifting to the ground. The sudden quiet was unnerving, the forest now a silent, frozen tableau. You stood, cradling the artifact, its warmth a stark contrast to the biting cold.
    As you gazed at it, the artifact began to vibrate gently in your hands. Then, a voice, soft and ethereal, whispered your name.
    "You have found me," it said, the words echoing in your mind. "We are bound by fate."
    Your heart pounded. How did it know your name? What ancient connection did you share with this mysterious object? You felt a strange pull, a sense of belonging, yet a shiver of fear ran down your spine. You knew you had to make a choice...
    """]
    static var secondText = ["""
    The sun beat down mercilessly, the heat shimmering off the rocky landscape. You shielded your eyes as you followed the artifact's glow, its light guiding you to the mouth of a sunlit cave. Stepping inside, you felt an immediate drop in temperature, the coolness a welcome relief from the oppressive heat outside.
    The cave was illuminated by a shaft of sunlight piercing through a narrow crevice above. In the center of the beam, resting on a pedestal, lay a rolled-up map. You approached cautiously, the artifact in your hand pulsing with a steady rhythm, as if urging you forward. With trembling fingers, you unrolled the map and laid it flat on the pedestal.
    """,
    """
    For a moment, the map revealed a detailed, ancient landscape, rich with forests, mountains, and hidden cities. The ink lines were so intricate, they seemed almost alive, tracing the topography of a world long forgotten. But as the first rays of sunlight touched the fragile parchment, it began to smolder. Wisps of smoke curled upwards, and you watched in awe and horror as the edges of the map burned away. The flames were slow and deliberate, consuming the borders first and then creeping inward, leaving behind only a single, clear path.
    As the last of the flames died down, a figure materialized at the start of the path. Cloaked and mysterious, the figure's features were obscured by shadows. They raised a gloved hand and beckoned you silently, the gesture both inviting and unsettling...
    Your heart raced. Should you trust this enigmatic guide or venture into the unknown on your own?
    """]
    static var thirdText = ["""
    The breeze was gentle but insistent, carrying with it a voice that seemed to whisper secrets of the world. You followed the ethereal guidance through dense forests and across babbling brooks, eventually emerging into a hidden grove bathed in golden light. The air was thick with magic, and mythical creatures-unicorns, griffins, and faeries-roamed freely, their presence untouched by the outside world.
    As you marveled at the serene beauty, the voice grew stronger, leading you to a gnarled old tree at the grove's heart.
    Within its twisted roots, a faint, glowing light pulsed. You approached cautiously and found a trapped spirit, its form shifting like mist within a crystal prison.
    """,
    """
    "Please," the spirit whispered, its voice filled with desperation. "Release me from this prison. I have been trapped for centuries. But beware, my freedom might come with a price."
    Your heart weighed heavy with the decision.
    Would you risk the unknown consequences to free the spirit, or should you continue your quest, leaving the spirit to its fate?
    """]
    static var fourthText = ["""
    The sky darkened ominously as foreboding clouds gathered on the horizon, casting a shadow over the land. The air grew heavy with tension, and an unsettling calm settled upon the landscape, as if nature itself held its breath in anticipation of the impending storm. But this was no ordinary tempest; it was the prophesied storm, whispered about in ancient texts and feared by all who knew of its existence. It was said to possess the power to unravel the very fabric of reality, threatening to engulf both your world and the mystical realm you had come to know.
    In a secluded clearing, hidden away from prying eyes, you convened with a council of wise beings representing both realms. Their presence exuded an aura of ancient wisdom and profound understanding. They spoke in hushed tones, their voices carrying the weight of the world's fate as they deliberated on how to confront the impending disaster.
    """,
    """
    Amidst the solemn gathering, the council unveiled two ancient artifacts, each pulsating with an otherworldly energy. One artifact was said to harness the raw power of the storm, offering the potential to wield its destructive force as a weapon.
    The other artifact held the key to quelling the tempest, promising to bring about peace and salvation to both realms.
    As the council presented the artifacts, you felt the weight of their significance pressing upon you. Each choice carried profound implications, and the fate of both realms hung precariously in the balance.
    The decision that lay before you was not merely a matter of choosing between two objects, but of determining the course of history itself. The stakes could not have been higher, and the burden of
    responsibility rested squarely upon your shoulders.
    """]
    static var fifthText = ["""
    The world fell into an eerie twilight as the moon crept inexorably across the sun, casting a shadow over the land during the rare solar eclipse. In this moment of celestial alignment, you stood alongside your trusted ally, both of you holding the artifact that had been the focus of your journey.
    But as the shadows deepened, your ally's demeanor shifted. Their gaze hardened, and a sinister gleam entered their eyes. With a chilling smile, they revealed their true intentions-to harness the artifact's power for their own ends, to reshape the world according to their vision.
    You were faced with a choice, a decision that would shape the course of your destiny and the fate of countless lives.
    """]
    static var sixthText = ["""
    The skies opened up, unleashing a deluge of rain that pounded the earth relentlessly.
    As the waters rose, revealing hidden secrets buried beneath the surface, you uncovered the artifact's origin-an ancient civilization destroyed by the very power it wielded.
    But as you gazed upon the artifact, its pulsating glow seemed to beckon to you, offering its full powers to be harnessed.
    Yet, with this offer came a chilling revelation-using the artifact could unleash catastrophie consequences, potentially repeating the tragic fate of the civilization that came before.
    With the weight of history and the fate of the world upon your shoulders, you stood at a crossroads, torn between two choices that could shape the destiny of all.
    """]
    static var seventhText = ["""
    As the dense fog enveloped your hideout, obscuring visibility and muffling all sound, a sense of foreboding settled over you.
    Shadows danced within the mist, hinting at the presence of lurking enemies closing in on all sides. The siege had begun, and your options were limited.
    But just as despair threatened to consume you, a glimmer of hope emerged-a secret passage, hidden within the walls of your hideout. With this revelation came a choice, one that would determine the fate of all who sought refuge within.
    """]
    static var eighthText = ["""
    As the storm raged outside, its fury matched only by the tumult of emotions within, you and your companions huddled together in the safety of shelter, seeking refuge from the relentless onslaught of wind and rain. Lightning cracked across the sky, illuminating the faces of those gathered, their expressions a mix of fear, determination, and grief.
    Amidst the chaos of the storm, a beloved ally emerged as a beacon of courage and selflessness, their actions speaking louder than any words ever could. With a resolute determination, they made the ultimate sacrifice, laying down their life to ensure the safety of the group.
    Their loss reverberated through the shelter, a poignant reminder of the harsh realities of the world outside. But even in death, their spirit lingered, offering solace and guidance to those they left behind.
    """,
                            """
    As the weight of the impending decision pressed down upon you, a twist emerged, challenging the very essence of your being.
    With the spirit of your fallen ally as your guide, you were confronted with a choice that would define your character and shape the trajectory of your journey.
    On one path lay the tempting allure of revenge, a primal urge fueled by grief and righteous anger. The desire to avenge your ally's demise burned hot within you, demanding justice for the wrongs inflicted upon them. Yet, as the spirit whispered in your ear, a second option emerged-a path illuminated by the light of compassion and forgiveness. To walk this path would be to honor the memory of your ally not with violence, but with acts of kindness and understanding. Would you succumb to the primal urge for revenge, or would you rise above it, forging a path of peace and reconciliation in honor of your fallen ally's memory?
    """]
    static var ninthText = ["""
    As you delved deeper into the cavern, tension thickened. Ice hung like daggers above, while fiery lava rivers below cast an eerie glow.
    At the heart of this frozen inferno lay the artifact you sought-an ancient relic said to hold the power to control the very elements themselves. But as you drew closer to your prize, a shadowy figure emerged from the darkness, its form shifting and wavering like a mirage in the heat and cold.
    To your surprise, the figure solidified into the form of an old, wise sage-a revered master of ancient lore and arcane knowledge. His eyes gleamed with a wisdom born of centuries of existence, and his voice echoed with the weight of countless ages.
    Unexpected twist: A wise sage appears from an underground prison, offering help in exchange for freedom. Do you trust him or face the cavern alone?
    """]
    static var tenthText = ["""
    In the climactic moments of the final battle, the very fabric of reality seemed to warp and bend as celestial bodies aligned, their cosmic energies converging to empower both you and your formidable antagonist. The air crackled with electricity, and the ground trembled beneath your feet as the forces of light and darkness clashed in a spectacular display of power.
    At the heart of this celestial tempest, you faced off against your foe-a formidable adversary fueled by dark ambition and boundless malice. Each blow exchanged between you was like a thunderclap echoing across the heavens, shaking the very foundations of the world.
    """,
    """
    As the battle reached its climax and the antagonist's strength faltered, a pivotal moment emerged-a juncture where destiny hung in the balance, awaiting your decision.
    With the adversary on the verge of defeat, a profound choice presented itself, one that carried immense weight and
    consequence. It was not merely a matter of securing victory in the heat of combat, but a decision that would resonate through the annals of history, shaping the destiny of the world for generations to come.
    In the charged atmosphere of conflict, with the fate of all hanging in the balance, you stood at the crossroads of choice. The options before you shimmered with possibility, each holding the power to tip the scales of fate in a different direction.
    The path you chose would not only determine the immediate outcome of the battle, but would set a course for the future, dietating the very fabric of the world yet to unfold.
    """]
    
}
