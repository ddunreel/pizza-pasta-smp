package com.davide.netheritekit;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ArmorMeta;
import org.bukkit.inventory.meta.trim.ArmorTrim;
import org.bukkit.inventory.meta.trim.TrimMaterial;
import org.bukkit.inventory.meta.trim.TrimPattern;
import org.bukkit.plugin.java.JavaPlugin;

import net.kyori.adventure.text.Component;
import net.kyori.adventure.text.format.NamedTextColor;
import net.kyori.adventure.text.format.TextDecoration;

import java.util.ArrayList;
import java.util.List;

public class NetheriteKit extends JavaPlugin {

    @Override
    public void onEnable() {
        getLogger().info("NetheriteKit loaded! Use /netheritekit to get your gear.");
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!command.getName().equalsIgnoreCase("netheritekit")) {
            return false;
        }

        Player target;

        if (args.length > 0) {
            target = Bukkit.getPlayer(args[0]);
            if (target == null) {
                sender.sendMessage(Component.text("Player not found: " + args[0], NamedTextColor.RED));
                return true;
            }
        } else if (sender instanceof Player player) {
            target = player;
        } else {
            sender.sendMessage(Component.text("Specify a player: /netheritekit <player>", NamedTextColor.RED));
            return true;
        }

        giveNetheriteKit(target);

        sender.sendMessage(Component.text("Gave full netherite kit to " + target.getName() + "!", NamedTextColor.GOLD));
        if (!sender.equals(target)) {
            target.sendMessage(Component.text("You received a full netherite kit!", NamedTextColor.GOLD));
        }

        return true;
    }

    @Override
    public List<String> onTabComplete(CommandSender sender, Command command, String alias, String[] args) {
        if (command.getName().equalsIgnoreCase("netheritekit") && args.length == 1) {
            List<String> completions = new ArrayList<>();
            String prefix = args[0].toLowerCase();
            for (Player player : Bukkit.getOnlinePlayers()) {
                if (player.getName().toLowerCase().startsWith(prefix)) {
                    completions.add(player.getName());
                }
            }
            return completions;
        }
        return List.of();
    }

    private void giveNetheriteKit(Player player) {
        // Helmet
        ItemStack helmet = createArmorPiece(
                Material.NETHERITE_HELMET,
                "Netherite Helmet",
                TrimPattern.WAYFINDER,
                TrimMaterial.AMETHYST
        );
        helmet.addUnsafeEnchantment(Enchantment.PROTECTION, 4);
        helmet.addUnsafeEnchantment(Enchantment.UNBREAKING, 3);
        helmet.addUnsafeEnchantment(Enchantment.MENDING, 1);
        helmet.addUnsafeEnchantment(Enchantment.AQUA_AFFINITY, 1);
        helmet.addUnsafeEnchantment(Enchantment.RESPIRATION, 3);

        // Chestplate
        ItemStack chestplate = createArmorPiece(
                Material.NETHERITE_CHESTPLATE,
                "Netherite Chestplate",
                TrimPattern.WAYFINDER,
                TrimMaterial.AMETHYST
        );
        chestplate.addUnsafeEnchantment(Enchantment.PROTECTION, 4);
        chestplate.addUnsafeEnchantment(Enchantment.UNBREAKING, 3);
        chestplate.addUnsafeEnchantment(Enchantment.MENDING, 1);

        // Leggings
        ItemStack leggings = createArmorPiece(
                Material.NETHERITE_LEGGINGS,
                "Netherite Leggings",
                TrimPattern.WAYFINDER,
                TrimMaterial.AMETHYST
        );
        leggings.addUnsafeEnchantment(Enchantment.PROTECTION, 4);
        leggings.addUnsafeEnchantment(Enchantment.UNBREAKING, 3);
        leggings.addUnsafeEnchantment(Enchantment.MENDING, 1);
        leggings.addUnsafeEnchantment(Enchantment.SWIFT_SNEAK, 3);

        // Boots
        ItemStack boots = createArmorPiece(
                Material.NETHERITE_BOOTS,
                "Netherite Boots",
                TrimPattern.WAYFINDER,
                TrimMaterial.AMETHYST
        );
        boots.addUnsafeEnchantment(Enchantment.PROTECTION, 4);
        boots.addUnsafeEnchantment(Enchantment.UNBREAKING, 3);
        boots.addUnsafeEnchantment(Enchantment.MENDING, 1);
        boots.addUnsafeEnchantment(Enchantment.FEATHER_FALLING, 4);
        boots.addUnsafeEnchantment(Enchantment.DEPTH_STRIDER, 3);
        boots.addUnsafeEnchantment(Enchantment.SOUL_SPEED, 3);

        // Equip directly if slots are empty, otherwise add to inventory
        var inv = player.getInventory();

        if (inv.getHelmet() == null) {
            inv.setHelmet(helmet);
        } else {
            addOrDrop(player, helmet);
        }

        if (inv.getChestplate() == null) {
            inv.setChestplate(chestplate);
        } else {
            addOrDrop(player, chestplate);
        }

        if (inv.getLeggings() == null) {
            inv.setLeggings(leggings);
        } else {
            addOrDrop(player, leggings);
        }

        if (inv.getBoots() == null) {
            inv.setBoots(boots);
        } else {
            addOrDrop(player, boots);
        }
    }

    private ItemStack createArmorPiece(Material material, String name, TrimPattern pattern, TrimMaterial trimMaterial) {
        ItemStack item = new ItemStack(material);
        ArmorMeta meta = (ArmorMeta) item.getItemMeta();

        meta.displayName(
                Component.text(name, NamedTextColor.LIGHT_PURPLE)
                        .decoration(TextDecoration.ITALIC, false)
                        .decoration(TextDecoration.BOLD, true)
        );

        ArmorTrim trim = new ArmorTrim(trimMaterial, pattern);
        meta.setTrim(trim);

        item.setItemMeta(meta);
        return item;
    }

    private void addOrDrop(Player player, ItemStack item) {
        var remaining = player.getInventory().addItem(item);
        for (ItemStack leftover : remaining.values()) {
            player.getWorld().dropItemNaturally(player.getLocation(), leftover);
        }
    }
}
