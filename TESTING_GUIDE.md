# 🧪 Testing Guide - Book Store App

This guide provides comprehensive testing procedures for the Book Store App. Follow these steps to ensure all features work correctly.

## 📋 Manual Testing Checklist

### 1. Home Screen Tests

#### Visual Tests
- [ ] App launches successfully with splash screen
- [ ] Home screen displays with all books correctly
- [ ] Book images load properly
- [ ] Recommended section shows books in horizontal scroll
- [ ] Best Selling section displays below Recommended
- [ ] "View All" buttons are visible for both sections
- [ ] Bottom navigation bar displays with 5 items
- [ ] App bar shows menu icon, search icon, and profile picture

#### Navigation Tests
- [ ] Menu/drawer icon opens navigation drawer
- [ ] Search icon navigates to search screen
- [ ] Profile picture is displayed correctly
- [ ] Bottom nav items are correctly labeled (Home, Favorites, Cart, Notifications, Profile)
- [ ] Tapping bottom nav items switches screens appropriately

#### Drawer Tests
- [ ] Drawer opens from left side
- [ ] Drawer header shows profile image and name
- [ ] All menu items are present:
  - [ ] Home
  - [ ] Favorites
  - [ ] Cart
  - [ ] Search
  - [ ] Notifications
  - [ ] Profile
  - [ ] Settings
  - [ ] About
- [ ] Tapping menu items navigates to correct screens
- [ ] Drawer closes after tapping items

#### Book Card Tests
- [ ] Tapping a book card navigates to details screen
- [ ] Book images display correctly
- [ ] Book titles and authors are readable
- [ ] Prices are formatted correctly
- [ ] Rating stars display accurately
- [ ] "View All" navigates to full list

---

### 2. Book Details Screen Tests

#### Display Tests
- [ ] Book image displays in full size
- [ ] Title and author are prominently displayed
- [ ] Description text is readable and wraps correctly
- [ ] Rating shows correct number of stars
- [ ] Price is displayed clearly
- [ ] Back button navigates to previous screen

#### Favorite Tests
- [ ] Favorite heart icon is visible
- [ ] Tapping favorite icon toggles state (filled/unfilled)
- [ ] Favorite state persists when navigating away and back
- [ ] Favorited book appears in Favorites screen
- [ ] Unfavoriting removes book from Favorites screen

#### Cart Tests
- [ ] "Add to Cart" button is visible and clickable
- [ ] Tapping "Add to Cart" shows confirmation SnackBar
- [ ] SnackBar displays book title
- [ ] SnackBar has "VIEW CART" action button
- [ ] Tapping "VIEW CART" navigates to cart screen
- [ ] Book appears in cart after adding
- [ ] Adding same book again increments quantity (not duplicate)

#### Buy Now Tests
- [ ] "Buy Now" button is visible and clickable
- [ ] Tapping "Buy Now" adds book to cart
- [ ] "Buy Now" navigates directly to cart screen
- [ ] Quantity is set to 1 for new book
- [ ] Existing book quantity increments

---

### 3. Cart Screen Tests

#### Display Tests
- [ ] Cart screen shows all added books
- [ ] Book images display correctly
- [ ] Book titles are visible (truncated if too long)
- [ ] Prices show correctly for each item
- [ ] Quantities display accurately
- [ ] Total price calculates correctly
- [ ] Back button returns to previous screen
- [ ] Delete/clear cart button is visible

#### Quantity Management Tests
- [ ] Plus (+) button increments quantity
- [ ] Minus (-) button decrements quantity
- [ ] Quantity cannot go below 1
- [ ] Price updates immediately when quantity changes
- [ ] Total price recalculates on quantity change
- [ ] UI updates smoothly without manual refresh

#### Cart Operations Tests
- [ ] Clear cart button removes all items
- [ ] Empty cart shows "No books in the cart!" message
- [ ] Empty cart displays appropriate empty state
- [ ] Browse books button (if any) returns to home

#### Checkout Tests
- [ ] Checkout button is visible
- [ ] Tapping checkout with empty cart shows error message
- [ ] Tapping checkout with items navigates to checkout screen
- [ ] Total amount passes correctly to checkout screen
- [ ] Checkout screen displays total amount

#### Persistence Tests
- [ ] Close and reopen app
- [ ] Cart items are still present
- [ ] Quantities are preserved
- [ ] Total price is correct after reload

---

### 4. Favorites Screen Tests

#### Display Tests
- [ ] Favorites screen accessible from bottom nav
- [ ] Favorites screen accessible from drawer
- [ ] Favorited books display correctly
- [ ] Book cards show all information
- [ ] Back button navigates to previous screen

#### Empty State Tests
- [ ] Empty favorites shows "No Favourite Books" message
- [ ] Empty state displays appropriate icon
- [ ] Empty state provides guidance to user

#### Interaction Tests
- [ ] Tapping a favorite book navigates to details
- [ ] Removing favorite from details updates favorites screen
- [ ] Adding favorite from details updates favorites screen
- [ ] Multiple books can be favorited

#### Persistence Tests
- [ ] Close and reopen app
- [ ] Favorite books are still present
- [ ] All favorited books display correctly

---

### 5. Search Screen Tests

#### Navigation Tests
- [ ] Search icon in app bar opens search screen
- [ ] Search option in drawer opens search screen
- [ ] Back button returns to previous screen

#### Search Functionality Tests
- [ ] Search text field is automatically focused
- [ ] Keyboard appears on screen load
- [ ] Typing in search field triggers search
- [ ] Results update in real-time as you type
- [ ] Search works for book titles (e.g., "Atomic")
- [ ] Search works for author names (e.g., "James")
- [ ] Search is case-insensitive
- [ ] Partial matches work (e.g., "Ato" finds "Atomic Habits")

#### Results Display Tests
- [ ] Matching books display in list
- [ ] Book cards show complete information
- [ ] Tapping result navigates to details screen
- [ ] "No books found" shows when no matches
- [ ] Empty search shows no results
- [ ] Clearing search clears results

---

### 6. View All Screen Tests

#### Navigation Tests
- [ ] "View All" in Recommended section works
- [ ] "View All" in Best Selling section works
- [ ] Back button returns to home screen

#### Display Tests
- [ ] Books display in grid layout (2 columns)
- [ ] All books from section are shown
- [ ] Book cards display correctly
- [ ] Images load properly
- [ ] Scrolling is smooth

#### Interaction Tests
- [ ] Tapping any book navigates to details
- [ ] All books are tappable
- [ ] Navigation works correctly from each book

---

### 7. Notification Screen Tests

#### Navigation Tests
- [ ] Notifications accessible from bottom nav
- [ ] Notifications accessible from drawer
- [ ] Back button returns to previous screen

#### Display Tests
- [ ] Empty state shows "No notifications yet"
- [ ] Empty state icon displays correctly
- [ ] Screen title is "Notifications"

---

### 8. Profile Screen Tests

#### Navigation Tests
- [ ] Profile accessible from bottom nav
- [ ] Profile accessible from drawer
- [ ] Back button returns to previous screen

#### Display Tests
- [ ] Profile image displays at top
- [ ] User name is shown
- [ ] Email is displayed
- [ ] All menu options are present:
  - [ ] Edit Profile
  - [ ] My Orders
  - [ ] Wishlist
  - [ ] Settings
  - [ ] Help & Support
  - [ ] Logout

#### Interaction Tests
- [ ] All menu items are tappable
- [ ] Logout button shows confirmation dialog
- [ ] Logout confirmation has Cancel and Logout options
- [ ] Tapping Cancel closes dialog
- [ ] Menu items lead to appropriate screens (when implemented)

---

### 9. Checkout Screen Tests

#### Navigation Tests
- [ ] Accessible from cart screen checkout button
- [ ] Back button returns to cart

#### Display Tests
- [ ] Total amount displays correctly
- [ ] "Checkout feature coming soon" message shown
- [ ] Shopping bag icon displays
- [ ] Back to Cart button is visible

#### Interaction Tests
- [ ] "Back to Cart" button returns to cart screen
- [ ] Correct total amount passed from cart

---

### 10. Data Persistence Tests

#### Cart Persistence
1. [ ] Add several books to cart with different quantities
2. [ ] Close the app completely (swipe away from recent apps)
3. [ ] Reopen the app
4. [ ] Verify all cart items are present
5. [ ] Verify quantities are correct
6. [ ] Verify total price is correct

#### Favorites Persistence
1. [ ] Add several books to favorites
2. [ ] Close the app completely
3. [ ] Reopen the app
4. [ ] Navigate to favorites screen
5. [ ] Verify all favorite books are present

#### Combined Persistence
1. [ ] Add books to both cart and favorites
2. [ ] Modify cart quantities
3. [ ] Close and reopen app
4. [ ] Verify both cart and favorites are preserved
5. [ ] Verify all quantities and data are correct

#### Clear Data Tests
- [ ] Clear cart removes all items
- [ ] Clearing cart persists (remains empty after app restart)
- [ ] Removing all favorites persists

---

### 11. Performance Tests

#### Loading Tests
- [ ] App launches quickly (< 3 seconds)
- [ ] Images load progressively
- [ ] No visible lag when scrolling book lists
- [ ] Smooth transitions between screens
- [ ] Search results appear quickly

#### Memory Tests
- [ ] Scroll through entire book catalog
- [ ] Navigate to multiple screens
- [ ] Add/remove many items to cart
- [ ] No memory leaks or crashes
- [ ] App remains responsive

#### State Management Tests
- [ ] Adding to cart updates immediately
- [ ] Quantity changes reflect instantly
- [ ] Favorite state updates across screens
- [ ] No manual refresh needed anywhere

---

### 12. Error Handling Tests

#### Image Errors
1. [ ] Temporarily remove an image file
2. [ ] Verify broken image icon appears
3. [ ] App doesn't crash
4. [ ] Other images still load correctly

#### Empty States
- [ ] Empty cart displays helpful message
- [ ] Empty favorites displays helpful message
- [ ] Empty search results show "No books found"
- [ ] Empty notifications show appropriate state

#### Edge Cases
- [ ] Adding book to cart 10+ times (quantity management)
- [ ] Very long book titles display correctly
- [ ] Very long descriptions are readable
- [ ] Rapid tapping buttons doesn't cause issues
- [ ] Navigator back button edge cases work

---

### 13. UI/UX Tests

#### Consistency Tests
- [ ] Color scheme consistent across all screens
- [ ] Font sizes appropriate and readable
- [ ] Button styles consistent
- [ ] Icons match theme
- [ ] Spacing and padding consistent

#### Accessibility Tests
- [ ] Text is readable on all backgrounds
- [ ] Buttons are appropriately sized
- [ ] Touch targets are adequate (not too small)
- [ ] Important actions are clearly visible

#### Responsiveness Tests
- [ ] Test on different Android screen sizes
- [ ] Test on different iOS screen sizes
- [ ] Test in portrait orientation
- [ ] Test in landscape orientation (if supported)
- [ ] UI elements don't overlap

---

## 🎯 Critical Issues to Watch For

1. **Data Loss**: Cart or favorites disappearing
2. **Duplicate Items**: Same book appearing multiple times in cart
3. **Price Calculation**: Incorrect total prices
4. **Navigation Loops**: Getting stuck in navigation
5. **Crashes**: App closing unexpectedly
6. **State Sync**: Favorites not updating across screens
7. **Performance**: Lag or freezing

---

## ✅ Testing Sign-off

### Tester Information
- **Tester Name**: ________________
- **Date**: ________________
- **App Version**: v1.0.0
- **Device**: ________________
- **OS Version**: ________________

### Overall Assessment
- [ ] All critical features working
- [ ] No crashes encountered
- [ ] Performance acceptable
- [ ] Data persistence working
- [ ] UI/UX polished
- [ ] Ready for release

### Notes & Issues Found
_________________________________
_________________________________
_________________________________

---

## 🐛 Reporting Issues

When reporting issues, please include:
1. Steps to reproduce
2. Expected behavior
3. Actual behavior
4. Screenshots/videos if applicable
5. Device and OS version
6. App version

---

**Last Updated**: February 6, 2026
