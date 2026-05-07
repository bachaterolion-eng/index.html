const chordData = {
    'red':    { name: 'C Major', notes: [261.63, 329.63, 392.00] }, // C, E, G
    'brown':  { name: 'F Major (2nd Inv)', notes: [261.63, 349.23, 440.00] }, // C, F, A
    'pink':   { name: 'G Major (1st Inv)', notes: [246.94, 293.66, 392.00] }, // B, D, G
    'purple': { name: 'F Major (1st Inv)', notes: [220.00, 261.63, 349.23] }, // A, C, F
    'orange': { name: 'G Major (2nd Inv)', notes: [293.66, 392.00, 493.88] }, // D, G, B
    'yellow': { name: 'C Major (1st Inv)', notes: [329.63, 392.00, 523.25] }, // E, G, C
    'green':  { name: 'F Major', notes: [349.23, 440.00, 523.25] }, // F, A, C
    'teal':   { name: 'G Major', notes: [392.00, 493.88, 587.33] }, // G, B, D
    'grey':   { name: 'C Major (2nd Inv)', notes: [392.00, 523.25, 659.25] }  // G, C, E
};

let audioCtx = null;

function playChord(color) {
    if (!audioCtx) audioCtx = new (window.AudioContext || window.webkitAudioContext)();
    
    const data = chordData[color];
    data.notes.forEach(freq => {
        const osc = audioCtx.createOscillator();
        const gain = audioCtx.createGain();
        
        osc.type = 'triangle'; // Softer tone for ear training
        osc.frequency.setValueAtTime(freq, audioCtx.currentTime);
        
        gain.gain.setValueAtTime(0.1, audioCtx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.0001, audioCtx.currentTime + 1.5);
        
        osc.connect(gain);
        gain.connect(audioCtx.destination);
        
        osc.start();
        osc.stop(audioCtx.currentTime + 1.5);
    });
}

2. The Interface (HTML/CSS)

This creates the visual buttons that match your revised chord sequencing guide.
HTML

<style>
    .grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; padding: 20px; }
    .chord-btn { border: none; height: 100px; color: white; font-weight: bold; cursor: pointer; border-radius: 8px; }
    .red { background-color: #e63946; }
    .brown { background-color: #5d4037; }
    .pink { background-color: #f06292; }
    .purple { background-color: #7b1fa2; }
    .orange { background-color: #ef6c00; }
    .yellow { background-color: #fbc02d; color: black; }
    .green { background-color: #2e7d32; }
    .teal { background-color: #00897b; }
    .grey { background-color: #757575; }
</style>

<div class="grid">
    <button class="chord-btn red" onclick="playChord('red')">C Major</button>
    <button class="chord-btn brown" onclick="playChord('brown')">F Major (2nd)</button>
    <button class="chord-btn pink" onclick="playChord('pink')">G Major (1st)</button>
    </div>
