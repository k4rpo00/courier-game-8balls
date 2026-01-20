function delivery_pick_customer() {

    static customers = undefined;

    if (is_undefined(customers)) {
        customers = [
            { portrait_name: "spr_portrait_01", name: "Ari",   lines: ["Oh, perfect timing. I’ve been coding and forgot to eat.","This smells incredible. Thank you!","Have a safe ride back."] },
            { portrait_name: "spr_portrait_02", name: "Max",   lines: ["Hi! Thanks for coming all the way out here.","I’m hosting game night — you just saved it.","Take care!"] },
            { portrait_name: "spr_portrait_03", name: "Samir", lines: ["Delivery! Nice.","Long day at work — this is exactly what I needed.","Appreciate you."] },
            { portrait_name: "spr_portrait_04", name: "Elena", lines: ["Yo! You made it.","Respect for the hustle.","Tell the pizzeria they’re legends."] },
            { portrait_name: "spr_portrait_05", name: "Nova",  lines: ["Hey… thank you.","Some days it’s the small kindness that helps most.","Have a good one, yeah?"] },
            { portrait_name: "spr_portrait_06", name: "Kofi",  lines: ["Let’s gooo, pizza arrived!","I’m sharing with my siblings — you’re a hero today.","Safe travels!"] },
            { portrait_name: "spr_portrait_07", name: "Jules", lines: ["Oh wow, it’s still warm.","I’m studying late — this is a lifesaver.","Thank you so much."] },
            { portrait_name: "spr_portrait_08", name: "Rey",   lines: ["Right on time.","The city can be a lot… food helps.","Be careful out there."] },
            { portrait_name: "spr_portrait_09", name: "Sora",  lines: ["Good evening.","Excellent service. Very professional.","You’ve earned this tip."] },
            { portrait_name: "spr_portrait_10", name: "Dr. Vale", lines: ["Ah, finally.","I was in the middle of research — and forgot dinner again.","Thank you. Truly."] },
            { portrait_name: "spr_portrait_11", name: "Ronan", lines: ["You’re tougher than you look — getting through these streets.","Smells like victory in a box.","Thanks. Keep your head up out there."] },
            { portrait_name: "spr_portrait_12", name: "Elder Rowan", lines: ["Ah, wonderful. You’ve brought supper at exactly the right time.","The city moves fast — but kindness still matters.","Thank you, my friend."] },
            { portrait_name: "spr_portrait_13", name: "Victor", lines: ["Thanks. I didn’t think anyone would find this place so quickly.","This helps more than you know.","Safe ride back — watch the corners."] },
              { portrait_name: "spr_portrait_14", name: "Lina",  lines: ["Oh—perfect timing.","I’ve been running on fumes all day.","Thanks. Seriously."] },
            { portrait_name: "spr_portrait_15", name: "Mira",  lines: ["Hi! You actually found my place.","This smells so good I might cry.","Have a safe ride back."] },
            { portrait_name: "spr_portrait_16", name: "Selene",lines: ["Delivery? Nice.","I was about to eat cereal for dinner again.","You saved me. Thank you."] },
            { portrait_name: "spr_portrait_17", name: "Amara", lines: ["Yes! Pizza time.","The city’s been loud today — this helps.","Take care out there."] },
            { portrait_name: "spr_portrait_18", name: "Noor",  lines: ["Hey, thanks for bringing it.","I know these routes can be rough.","Drive safe, okay?"] },
        ];
    }

    if (!variable_global_exists("last_customer_i")) global.last_customer_i = -1;

    var count = array_length(customers);
    var i = irandom(count - 1);
    if (count > 1 && i == global.last_customer_i) i = (i + 1) mod count;
    global.last_customer_i = i;

    var c = customers[i];

    var pid = -1;


    if (variable_struct_exists(c, "portrait_name")) {
        pid = asset_get_index(c.portrait_name);
        if (pid == -1) show_debug_message("BAD PORTRAIT NAME: " + string(c.portrait_name));
    }

    else if (variable_struct_exists(c, "portrait")) {
        pid = c.portrait;
    }


    return {
        portrait: pid,
        name: c.name,
        lines: c.lines
    };
}
